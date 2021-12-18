Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECFE479BFA
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Dec 2021 19:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233854AbhLRSIi (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 18 Dec 2021 13:08:38 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34385 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233800AbhLRSIg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 18 Dec 2021 13:08:36 -0500
Received: by mail-ot1-f46.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso7121563otj.1;
        Sat, 18 Dec 2021 10:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OSZxOLWJVHCW/yEQPrdtTr4d2oittVVIwMhT0wN0Meo=;
        b=HfohVhCWwjnQUhe17wcJpvNk8Qby+qLifhoQGgnloadHojBqkXdDWRTP7/mHeZa0fZ
         Q5eHeU1YP3e7ZWQZeAebFHDcpt9D/MdwFSdYAGrcEnuziCrcFsaxs1k4NfotXa7JEJrc
         8kNM0MU6jrp53wwNhFSKeAqV5Ozaz/lWod2Y1DNISKFLHGgiaEWWNZK0J+mk4aXlqjDT
         bxUG8U7dQxwSuVtRjbMN4wz+eG6mNAbXIs2Tm0dy9iQ6svtjQaBU0heRk0FYEoeqjVTY
         X3E1g5LoymdoxadRWiJFjU0q7FsrRZ058U4L7fcGwUkcIsCAUjgDYkjxeVhrv5ddSz2M
         zFyA==
X-Gm-Message-State: AOAM5336d+faH9TWdpgzrALsN8i3yDF7keusvNlb0iQ0Wf6jrAWL5Lcl
        zoxzcfaGB2Dz8NAe56PEpQ==
X-Google-Smtp-Source: ABdhPJzv2+fjWlI2ksOt6vnHGd7v5gwfiDjv2p7MydCH//K3UK1WfpSZmcjuT+Tmvo9S0uoEb1MOtw==
X-Received: by 2002:a9d:17cc:: with SMTP id j70mr5941189otj.313.1639850915616;
        Sat, 18 Dec 2021 10:08:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e3sm2289702otk.71.2021.12.18.10.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 10:08:34 -0800 (PST)
Received: (nullmailer pid 72444 invoked by uid 1000);
        Sat, 18 Dec 2021 18:08:26 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-rtc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20211217170311.2796798-1-thierry.reding@gmail.com>
References: <20211217170311.2796798-1-thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: rtc: ds1307: Convert to json-schema
Date:   Sat, 18 Dec 2021 12:08:26 -0600
Message-Id: <1639850906.485205.72443.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, 17 Dec 2021 18:03:10 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the DS1307 (and compatible) RTC bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/rtc/rtc-ds1307.txt    |  52 ---------
>  .../devicetree/bindings/rtc/rtc-ds1307.yaml   | 104 ++++++++++++++++++
>  2 files changed, 104 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1570210


ds1307@68: $nodename:0: 'ds1307@68' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/imx6q-tbs2910.dt.yaml

ds1339@68: $nodename:0: 'ds1339@68' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/imx53-tx53-x03x.dt.yaml
	arch/arm/boot/dts/imx53-tx53-x13x.dt.yaml

m41t00@68: $nodename:0: 'm41t00@68' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/imx51-ts4800.dt.yaml

m41t0m6@68: $nodename:0: 'm41t0m6@68' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/imx7d-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-aster.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-emmc-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7d-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-aster.dt.yaml
	arch/arm/boot/dts/imx7s-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf500-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/vf610-colibri-eval-v3.dt.yaml

mcp79400@6f: $nodename:0: 'mcp79400@6f' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/am335x-pdu001.dt.yaml

mcp7940x@6f: $nodename:0: 'mcp7940x@6f' does not match '^rtc(@.*|-[0-9a-f])*$'
	arch/arm/boot/dts/imx6dl-tx6s-8034-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6s-8035-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-8033-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-80xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6dl-tx6u-81xx-mb7.dt.yaml
	arch/arm/boot/dts/imx6qp-tx6qp-8037-mb7.dt.yaml
	arch/arm/boot/dts/imx6qp-tx6qp-8137-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-1036-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-10x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6q-tx6q-11x0-mb7.dt.yaml
	arch/arm/boot/dts/imx6ul-tx6ul-mainboard.dt.yaml

rtc@6f: interrupts-extended: [[1, 0, 2, 1], [154, 1060]] is too long
	arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml
	arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml

