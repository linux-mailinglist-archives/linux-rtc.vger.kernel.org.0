Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFD7E43CBB0
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Oct 2021 16:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238108AbhJ0OO4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Oct 2021 10:14:56 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:33466 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbhJ0OOz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Oct 2021 10:14:55 -0400
Received: by mail-oo1-f43.google.com with SMTP id q39-20020a4a962a000000b002b8bb100791so983235ooi.0;
        Wed, 27 Oct 2021 07:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=xHwTiCe25Vq0S+cLU9+jyc/EEHh4jWHAnrWkyaRQ0AU=;
        b=aX+OblF28wUgMIviTSKtwNYuLlRB1bjfN87+rBO9Sr2nPJERmMIKUcFiAt00nPPEcM
         Q+hktmxVU5B01hY3oZ9o47vK3FcaOMa9K/L4IzWHMtZOLY8XjOodE2FtC5p8bzn6P/gU
         tvarbl8oXC5UW45AZ45rZTJsb1K6e/vBhA2h+UFeIVLOc6tYTXN744+rSPI5qSm4YdpL
         uYGbOP1m3GDlm4/EIQlyhU/miLbbzHGI3vx+bzU2EZwa0sDrq9xoAqe+O4Zrwr7dI0uk
         2ODyNaLgAcx8oW3AHIeBO8pTwkq8xYFgyusxlVBkDWUZG1aJvm2dxCtTw/90a2d51D7m
         kyMg==
X-Gm-Message-State: AOAM533fK/Z6cPQi06pDsiR2klCUrtc3xZLBBNw0M/gvVOtTSdbMu6po
        b1VGLBMZIWIUPR8mT05+9A==
X-Google-Smtp-Source: ABdhPJyZEjWOZ4sONCj9i+vxmlu+p2sO7NBgcLV+PbDqKV1EGUTjJo5g7D3M9LI8MuRor18zTgUPbA==
X-Received: by 2002:a4a:9682:: with SMTP id s2mr22607921ooi.29.1635343949733;
        Wed, 27 Oct 2021 07:12:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id t18sm18764otd.37.2021.10.27.07.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:12:29 -0700 (PDT)
Received: (nullmailer pid 862168 invoked by uid 1000);
        Wed, 27 Oct 2021 14:12:28 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-watchdog@vger.kernel.org,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Support Opensource <support.opensource@diasemi.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
In-Reply-To: <20211027052323.1788476-2-alexandre.ghiti@canonical.com>
References: <20211027052323.1788476-1-alexandre.ghiti@canonical.com> <20211027052323.1788476-2-alexandre.ghiti@canonical.com>
Subject: Re: [PATCH 2/2] dt-bindings: Migrate DA9063 text bindings to YAML
Date:   Wed, 27 Oct 2021 09:12:28 -0500
Message-Id: <1635343948.038781.862167.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 27 Oct 2021 07:23:23 +0200, Alexandre Ghiti wrote:
> DA9063 devices bindings used text format, so migrate those bindings to YAML
> format before adding any new bindings.
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  .../bindings/input/da9063-onkey.yaml          |  39 ++++++
>  .../devicetree/bindings/mfd/da9063.txt        | 111 ------------------
>  .../devicetree/bindings/mfd/da9063.yaml       |  98 ++++++++++++++++
>  .../bindings/regulator/da9063-regulator.yaml  |  51 ++++++++
>  .../devicetree/bindings/rtc/da9063-rtc.yaml   |  31 +++++
>  .../bindings/watchdog/da9063-watchdog.yaml    |  31 +++++
>  6 files changed, 250 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/da9063-onkey.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/da9063-regulator.yaml
>  create mode 100644 Documentation/devicetree/bindings/rtc/da9063-rtc.yaml
>  create mode 100644 Documentation/devicetree/bindings/watchdog/da9063-watchdog.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/da9063.yaml:26:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/mfd/da9063.yaml:27:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mfd/da9063.example.dts:21.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/mfd/da9063.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):
Documentation/devicetree/bindings/input/da9062-onkey.txt: Documentation/devicetree/bindings/mfd/da9063.txt

See https://patchwork.ozlabs.org/patch/1546751

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

