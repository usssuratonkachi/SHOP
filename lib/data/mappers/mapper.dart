abstract class Mapper<Src, Dst> {

  Dst? map(Src? model);

  List<Dst> mapList(List<Src>? models) =>
      models?.map(map).toList().whereType<Dst>().toList() ?? List<Dst>.empty();
}