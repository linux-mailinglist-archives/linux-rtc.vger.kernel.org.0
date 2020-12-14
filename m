Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF9AA2D99B1
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Dec 2020 15:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407457AbgLNOUV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 14 Dec 2020 09:20:21 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33034 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407340AbgLNOUP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 14 Dec 2020 09:20:15 -0500
Received: by mail-oi1-f196.google.com with SMTP id d27so19311563oic.0;
        Mon, 14 Dec 2020 06:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UkqOBpA+sobRPXScoDiP93aXuuhd73OJoAjrBbb2oRc=;
        b=WbGfhx9J1iYdnX13FVNZqmCMry4LyONB9mP6fduff1MGXwygV95Izimwex8xJLpOkL
         Uv1Nra74xHqOfoAcYlohWKxHflHWXxJQ0BA72p3cFFmzefv6XlKhzVJ+VZlhxzhjD7iq
         TIBqbJrLxF45vOc1naCqJw9YejxCbUHKkPu0Olont6WDJ7NeBBjmBDqmhhPpQas4dcvl
         6/hlzaunm6q3VOhCZhBodNrWAaooCTTu+y6gJa8BwNgBEcr8n5WJ6H+asNN+cxc+ET5M
         e1SCAPXqHE36osnYVAXwq38WAo6v3VuKrxlAsEAMXj+Sk0b9G/o6L9gP5qjbnHPynkIY
         ks6A==
X-Gm-Message-State: AOAM533IBTmkqe2MFqv9zVbQgyiuFFolAUsnOd6D5eqvjMfzpNMdEO1v
        oXG/vTOI0xu2n5zVCWjNCQnAbLI57A==
X-Google-Smtp-Source: ABdhPJxyzh/YrQ01yKXST7BML6rMasRDeuvVag4QpD/e6yEYZ0MNub6bub+8QAkiHqjZq/nBjlGLYg==
X-Received: by 2002:aca:47cb:: with SMTP id u194mr18668701oia.63.1607955574495;
        Mon, 14 Dec 2020 06:19:34 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w8sm3942426oos.37.2020.12.14.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:19:33 -0800 (PST)
Received: (nullmailer pid 1862084 invoked by uid 1000);
        Mon, 14 Dec 2020 14:19:32 -0000
Date:   Mon, 14 Dec 2020 08:19:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [RFC PATCH 06/12] dt-bindings: rtc: sun6i: add compatible string
 for V831/V833 RTC
Message-ID: <20201214141932.GA1861466@robh.at.kernel.org>
References: <20201212040157.3639864-1-icenowy@aosc.io>
 <20201212040641.3640916-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201212040641.3640916-1-icenowy@aosc.io>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sat, 12 Dec 2020 12:06:35 +0800, Icenowy Zheng wrote:
> V831/V833 SoCs (the same die) have a RTC block similar to the one in H6,
> but allow to generate the osc32k clock from osc24M.
> 
> Add a new compatible string for that.
> 
> The functionality of dividing osc24M to generate osc32k is still TODO.
> 
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml:102:13: [error] duplication of key "const" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 123, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 101, column 13
found duplicate key "const" with value "allwinner,sun50i-h6-rtc" (original value: "allwinner,sun8i-v831-rtc")
  in "<unicode string>", line 102, column 13

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1415362

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

