Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0457837EE63
	for <lists+linux-rtc@lfdr.de>; Thu, 13 May 2021 00:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237523AbhELVmc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 May 2021 17:42:32 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34652 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385231AbhELUHh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 12 May 2021 16:07:37 -0400
Received: by mail-oi1-f176.google.com with SMTP id u11so2262339oiv.1;
        Wed, 12 May 2021 13:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=s2DS0EP+Lhy5SLk5RYFh/X7aa8tDWN8bv9ksm/BaqCo=;
        b=DKtHA1duQcshx5qA4uufmPEIJtw1pp3CWVK1wkAC2ojGm0+4w3qZLtRkWfVUysMtxb
         Muf8ZxxUyyAzdPgCdrPOXIr0JQzhckrZvJsXm3FA+J1G8kYFr68VSnzUGXAbthu8KyBy
         ynykGr1BMbJh7x0L55+bXmeeC3N3Jo1RNfQ6lk9pzoBgFVKnksuDQe/U+xPvASX4jgT5
         hpOJ96oIV9C9Q0GgdpCn0V3QU6GYkuPo6bsCt15FTR2+MdA1hu5CBHjEXIHCr9QO+Skz
         CJSJ36fRypx6abOp7yi0m5/yBG1jTRiBCE+RR8OAcBYG4lEzYsATbVz1RS9H+pHLEXGA
         anyA==
X-Gm-Message-State: AOAM530ryBQ2+duFQLMIgygabDt6s0ay9zr8k/5dmLyFy00bqgBwRWS6
        gP+BPbCpd+kgZoOb2OWlqQ==
X-Google-Smtp-Source: ABdhPJyV51HHN+G1WFSrWZTGxA01fzLDa78XZO+hOz79AYboo84b25VEYMKObdQerJo6+HohNlsybg==
X-Received: by 2002:aca:f245:: with SMTP id q66mr28094334oih.179.1620849987507;
        Wed, 12 May 2021 13:06:27 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p1sm178247otk.58.2021.05.12.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:26 -0700 (PDT)
Received: (nullmailer pid 204082 invoked by uid 1000);
        Wed, 12 May 2021 18:35:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     lewis.hanly@microchip.com, david.abdurachmanov@gmail.com,
        conor.dooley@microchip.com, palmer@dabbelt.com,
        devicetree@vger.kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        padmarao.begari@microchip.com, cyril.jean@microchip.com,
        robh+dt@kernel.org
In-Reply-To: <20210512111133.1650740-2-daire.mcnamara@microchip.com>
References: <20210512111133.1650740-1-daire.mcnamara@microchip.com> <20210512111133.1650740-2-daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: rtc: microchip: Add Microchip PolarFire host binding
Date:   Wed, 12 May 2021 13:35:16 -0500
Message-Id: <1620844516.500323.204081.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 12 May 2021 12:11:32 +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire real-time
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
   19 |         #include <dt-bindings/clock/microchip,mpfs-clock.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1477539

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

