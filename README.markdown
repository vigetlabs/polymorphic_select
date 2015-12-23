Polymorphic Select
==================

Have a polymorphic belongs to relationship? Need to show it on a form? How you going to do that?

No worries, friendo. I got you covered:

```ruby
f.input :featuring,
        as: :polymorphic_select,
        grouped_options: {
          Animal  => Animal.by_name,
          Exhibit => Exhibit.by_name
        }
```

***

<a href="http://code.viget.com">
  <img src="http://code.viget.com/github-banner.png" alt="Code At Viget">
</a>

Visit [code.viget.com](http://code.viget.com) to see more projects from [Viget.](https://viget.com)
