为什么使用分类？（以Demo示例）

1. 把ViewController按不同的功能类别分解到ViewController+Associate和ViewController+Printer中,
以便多个开发者共同完成一个类.

2. ViewController+Associate公开了ViewController中的私有属性"num"和私有方法"testNum".

3. ViewController+Associate.h添加了属性"count"，仅仅表示声明了setter和getter方法，并
没有添加成员变量，需要用runtime关联对象在ViewController+Associate.m实现setter和getter.

4. ViewController+Associate.h签署了协议"VCDelegate"

5. ViewController+Printer分解了ViewController的类方法和实例方法，并重写了ViewController的父类
的"reloadInputViews"方法.

6. ViewController主类的load方法先调用，分类的load方法早编译早调用.

7. ViewController主类的initialize方法可以被分类重写，最后编译的分类的initialize重写方法被调用
（类第一次接收消息时initialize被调用）


怎么样实现分类？

1. 编译：编译器吧OC层面的category编译成C层面的runtime中的结构体.

struct category_t {

const char *name;                               //主类名
classref_t cls;                                 //分类指向主类的指针
struct method_list_t *instanceMethods;          //分类实例方法链表
struct method_list_t *classMethods;             //分类类方法链表
struct protocol_list_t *protocols;              //分类协议链表
struct property_list_t *instanceProperties;     //实例属性链表（只是声明了setter和getter方法）

};

2. 运行：
_objc_init  -->   map_images_nolock  -->   _read_images(是否有分类)  -->_getObjc2CategoryList(遍历分类内容)   -->   remethodizeClass(整合所有分类)   
-->attachCategories  -->   attachLists(将分类方法列表合并到主类方法之前，分类的实例方法列表合并到主类的实例方法之前，分类的类方法列表合并到主类的元类方法列表之前)

3. 主类编译之后，成员变量链表(一维指针)指向的内存布局已确定，所以分类不能添加成员变量，并且分类的结构体中也没有成员变量的链表，
只是有实例属性的链表用于声明setter和getter方法，以便在运行阶段，利用runtime关联对象实现setter和getter方法，
完整的实例属性 = 成员变量(实例变量ivar) + setter + getter.

4. 主类编译之后，方法链表(二维指针)是可以修改指向的内存地址，所以分类可以添加方法.

5. 关联对象并不是存储在被关联对象本身内存中，而是存储在全局的统一的一个AssociationsManager中，如果设置关联对象为nil，就相当于是移除关联对象.



