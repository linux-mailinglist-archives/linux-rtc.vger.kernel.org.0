Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF6241AEFF
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 14:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240650AbhI1MaD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 08:30:03 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:43904 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240642AbhI1MaB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 08:30:01 -0400
Received: by mail-oi1-f175.google.com with SMTP id q16so2034205oiw.10;
        Tue, 28 Sep 2021 05:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1e86EGaNQSFspYR+g+H0ErCWrHt26ybPuetKkhUZAfk=;
        b=1Eh8Cx0esdOMT9NQbs01WL3ulo1mrQy/9lr5ytQiI7AjMEAxV7DT5qHRZ8pRgNRxxa
         2DvuzdbMluAVHNJzdzfTdO2hYIm3kRuXTsDGJ7WLMnb6yGkr4r9MeDLJReqVFemqAP8I
         c00hSezp8gZPOuB2J011AEIdfVdP8juYfcLp1XeDorrnVGVlu9UhZJ3JQ3V57kZlS5tO
         sUEQq+06jmMh/dvDUAPTAPWS+UhYVKg6wu09IWSDYpQ7d0L53lJmDAr1UKcUrQwTVpNG
         ikfxb7pV5MPY/gc+mwO5HPubB2jhGRPEFWgFga4CQ4UpYsP0AYd53ZzA+RGiYQ1PeT5c
         ZQ2w==
X-Gm-Message-State: AOAM530dq4yXSsXGNFw+uiBHvVMc3JBY0U7JGckQeARnS8T0ZJwSRpsb
        LAz3TLOAPdp1+yEpr+FKkQ==
X-Google-Smtp-Source: ABdhPJxdweC4ViDWcuCSxhRm4TIg6wXEUwWOerbwOEDdBE9l96ZkoENskHa8vCNSMU3oKGJlcGSTAg==
X-Received: by 2002:aca:ab4d:: with SMTP id u74mr3334236oie.120.1632832102003;
        Tue, 28 Sep 2021 05:28:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id z12sm4585394ote.16.2021.09.28.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 05:28:20 -0700 (PDT)
Received: (nullmailer pid 963816 invoked by uid 1000);
        Tue, 28 Sep 2021 12:28:18 -0000
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rtc@vger.kernel.org
In-Reply-To: <20210928080335.36706-3-samuel@sholland.org>
References: <20210928080335.36706-1-samuel@sholland.org> <20210928080335.36706-3-samuel@sholland.org>
Subject: Re: [PATCH v2 2/9] dt-bindings: rtc: sun6i: Add H616, R329, and D1 support
Date:   Tue, 28 Sep 2021 07:28:18 -0500
Message-Id: <1632832098.554951.963815.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, 28 Sep 2021 03:03:28 -0500, Samuel Holland wrote:
> These new RTC variants all have a single alarm, like the R40 variant.
> 
> For the new SoCs, start requiring a complete list of input clocks. The
> H616 has three required clocks. The R329 also has three required clocks
> (but one is different), plus an optional crystal oscillator input. The
> D1 RTC is identical to the one in the R329.
> 
> And since these new SoCs will have a well-defined output clock order as
> well, they do not need the clock-output-names property.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> Changes since v1:
>   - Properly update the DT binding clocks and clock-names properties.
> 
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 72 ++++++++++++++++++-
>  include/dt-bindings/clock/sun6i-rtc.h         | 10 +++
>  2 files changed, 79 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/clock/sun6i-rtc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:122:9: [error] duplication of key "minItems" in mapping (key-duplicates)
./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:150:9: [error] duplication of key "minItems" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.example.dts'
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
  in "<unicode string>", line 121, column 9
found duplicate key "minItems" with value "3" (original value: "3")
  in "<unicode string>", line 122, column 9

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.example.dts] Error 1
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
  in "<unicode string>", line 121, column 9
found duplicate key "minItems" with value "3" (original value: "3")
  in "<unicode string>", line 122, column 9

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys


During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 67, in <module>
    ret = check_doc(f)
  File "/usr/local/bin/dt-doc-validate", line 30, in check_doc
    print(filename + ":", exc.path[-1], exc.message, file=sys.stderr)
AttributeError: 'DuplicateKeyError' object has no attribute 'path'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1533753

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

