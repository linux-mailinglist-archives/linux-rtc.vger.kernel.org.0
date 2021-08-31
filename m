Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF773FC949
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Aug 2021 16:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhHaODl (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Aug 2021 10:03:41 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:40476 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbhHaODj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Aug 2021 10:03:39 -0400
Received: by mail-oo1-f51.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so5684226ooh.7;
        Tue, 31 Aug 2021 07:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=siSurg9Mj4lOmhFCOYxSAG/uyAcqicBKkSE3YXG7CoY=;
        b=YnzZXXM/FlWOqHDA+AuA6UXJcv9Fgk+K3g2LscfAJP3FPCr9IPe/JPS/Tm5pgKB9Yu
         PsM7vEoEEdfR0YRZfZD0HAXbHe7fHMkkpoNay9P0/i5o9GhcTTyYMnybYpT4avLSRpdd
         p7jIJ4Hb6trokkMhGHp8jpQFBkp2nVgRUtV1ywuA0BeTZXCWtHk3iuCp82aei/JsIg85
         j64rOU/XyrxMyOReZ1N8C4/sO1xtJqBigDnpkWzkXTgcNpMs2fc8x8AU76u6X7RUFE0U
         YN6yr76GMzh+33G8uCWmySU0NHpigbD7CWYk7HUn8DUsc0vgi5V7Q+1HizyQ65RWnT2T
         m1UA==
X-Gm-Message-State: AOAM533w5v6dvtpZCEnLmG3D6AohVJQqi2rPV0+VdpzvPkxCcgVze4bz
        rov/LEVr9QO+MWSXzycdug==
X-Google-Smtp-Source: ABdhPJyUxmnfU7FI1daQ0AqrjWJ2CDyymFn+KqhOXS1I4AGy5V1YBoicf4L8ANNGXG/oe0lvmENqEQ==
X-Received: by 2002:a4a:e907:: with SMTP id z7mr14641574ood.20.1630418563544;
        Tue, 31 Aug 2021 07:02:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w23sm3900313otk.56.2021.08.31.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 07:02:42 -0700 (PDT)
Received: (nullmailer pid 79946 invoked by uid 1000);
        Tue, 31 Aug 2021 14:02:42 -0000
From:   Rob Herring <robh@kernel.org>
To:     Navin Sankar Velliangiri <navin@linumiz.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20210831074922.273809-1-navin@linumiz.com>
References: <20210831074922.273809-1-navin@linumiz.com>
Subject: Re: [PATCH] rtc: bq32000: Add TI BQ32002 compatible
Date:   Tue, 31 Aug 2021 09:02:42 -0500
Message-Id: <1630418562.136316.79945.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 31 Aug 2021 13:19:22 +0530, Navin Sankar Velliangiri wrote:
> The TI BQ32002 is software compatible with the TI BQ32000,
> add DT compatible entries
> 
> Signed-off-by: Navin Sankar Velliangiri <navin@linumiz.com>
> ---
>  Documentation/devicetree/bindings/rtc/ti,bq32000.yaml | 11 +++++++++++
>  drivers/rtc/rtc-bq32k.c                               |  2 ++
>  2 files changed, 13 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/rtc/ti,bq32000.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 17, column 5
found duplicate key "const" with value "ti,bq32002" (original value: "ti,bq32000")
  in "<unicode string>", line 18, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/rtc/ti,bq32000.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 25, in check_doc
    testtree = dtschema.load(filename, line_number=line_number)
  File "/usr/local/lib/python3.8/dist-packages/dtschema/lib.py", line 623, in load
    return yaml.load(f.read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 122, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 132, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 722, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 446, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 264, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 17, column 5
found duplicate key "const" with value "ti,bq32002" (original value: "ti,bq32000")
  in "<unicode string>", line 18, column 5

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/ti,bq32000.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/rtc/ti,bq32000.yaml
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1522467

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

