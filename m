Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32003262100
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Sep 2020 22:22:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgIHUWt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Sep 2020 16:22:49 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:41865 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729037AbgIHUWq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Sep 2020 16:22:46 -0400
Received: by mail-il1-f194.google.com with SMTP id w8so163782ilj.8;
        Tue, 08 Sep 2020 13:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FyBg+zneb/9bLICg6AikBUsZJLGnZjc2gr6L785oVlk=;
        b=g6L+CnxYQWMuCrI+mentW0hwIO6OqXgV10ZWvPYEiI79q8NJuLKx5yT3+GeOGuuKeH
         lZJ41WQPOtBwde15n4t2AWvJSwdUXpE/6XEHv2qLc2cM68GgavnOwT8V63RUE9GB5LyP
         ouYi+DqPL3EOeAh8jOIUtfxkCDVI5Mhq+mBvB6gkSXww3G+6Zb0pPIYdVc8sIfEIUUH2
         thC8/FzYF2zJP0Lqr31F6TtGa0DvwmH4MvW8F+zoCdasMfVDrqMowi1pSsHsG4+2X2Lz
         YXLWi22NsxVaNHjCIs9IlCMvxIJR3aDIFofxfkL+g+jHOjBAtTimNk+E9bLX8bzgcDiG
         MKgg==
X-Gm-Message-State: AOAM530X6dnEpbZ0N01nIt/hGRsmQCHXBR3fvBbCv7l6VfTCR9ulyfqT
        7PJXl9P2W3pChJyU/rXTuw==
X-Google-Smtp-Source: ABdhPJzKjobdOVbGN1AKT4M6mQrxwizh0B+r5cHWdQQ8JdV8THIbMUrGHkNFgA8KouLBk1bwdIMyCA==
X-Received: by 2002:a05:6e02:14d:: with SMTP id j13mr444081ilr.245.1599596565286;
        Tue, 08 Sep 2020 13:22:45 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t3sm98815ilq.56.2020.09.08.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:22:44 -0700 (PDT)
Received: (nullmailer pid 845596 invoked by uid 1000);
        Tue, 08 Sep 2020 20:22:43 -0000
Date:   Tue, 8 Sep 2020 14:22:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: rtc: let aux-voltage-chargeable
 supersede trickle-diode-disable
Message-ID: <20200908202243.GA844020@bogus>
References: <20200907142727.26472-1-bst@pengutronix.de>
 <20200907142727.26472-2-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907142727.26472-2-bst@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 07 Sep 2020 16:27:20 +0200, Bastian Krause wrote:
> Some RTCs can be equipped with a chargeable battery or supercap.
> Every RTC allowing this whose driver's implement it are charged by
> default. To disable this the trickle-diode-disable flag exists.
> 
> If a driver did not support charging and some time later one wants to
> add that feature, there is currently no way to do it without breaking
> dt backwards compatibility. RTCs on boards without the
> trickle-diode-disable flag in their device tree would suddenly charge
> their battery/supercap which is a change in behavior.
> 
> Change that by introducing aux-voltage-chargeable, not as a flag but as
> a uint32 enum allowing to set "do not charge" (0) or "charge" (1). This
> dt property is optional, so we can now distinguish these cases.
> 
> Care must be taken to support the old behavior for device trees without
> aux-voltage-chargeable nonetheless to stay compatible.
> 
> Suggested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
> In a previous series aux-voltage-chargeable was added as a ds1307 dt
> property. Discussions lead to turning that into a generic rtc dt
> property:
> https://lore.kernel.org/linux-rtc/98fa7181-3ebe-d7c3-cfac-fee841c81e15@pengutronix.de/T/
> ---
>  Documentation/devicetree/bindings/rtc/rtc.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 


My bot found errors running 'make dt_binding_check' on your patch:

Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 111, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 891, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: mapping values are not allowed in this context
  in "<unicode string>", line 25, column 24
make[1]: *** [Documentation/devicetree/bindings/Makefile:18: Documentation/devicetree/bindings/rtc/rtc.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/rtc/rtc.example.dts'
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/rtc/rtc.yaml:  mapping values are not allowed in this context
  in "<unicode string>", line 25, column 24
schemas/rtc/rtc.yaml: ignoring, error parsing file
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/rtc/rtc.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/rtc/rtc.yaml
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1358937

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

