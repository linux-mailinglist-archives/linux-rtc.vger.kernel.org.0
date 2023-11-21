Return-Path: <linux-rtc+bounces-341-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F087F2AA7
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 11:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CA91C20D06
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 10:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD2C3C6A7;
	Tue, 21 Nov 2023 10:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 897131BC3;
	Tue, 21 Nov 2023 02:37:14 -0800 (PST)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35930447ae9so16775825ab.2;
        Tue, 21 Nov 2023 02:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700563033; x=1701167833;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5hcXg4tX4WDk4gi5wFSZzrUcbYrCoXo++qInb7PH/U=;
        b=nIIjwcH6Qj3lUbYegFJLremlXchaLquR2kqrWVt1l/GrkZss5KQqrBHpIfy69RtUNq
         Q+R/wobTWC7zmjwcr/6VhKuHolTAsNB0GggqtQMgQ64fwdfr3y9gaExSLuSsk1FflM9u
         nF1v1jv7h9nr6WAF8PPUGGVRx6rlcIyvBJ7oaAC813mAUy2am9mHTI7XZnzQt51Pva4k
         Wio9YLrplGStY5RQIP91BPngvGcrq3KQBZU39dnQy/dFP6fTJw24N3OMSmCCGt3B78Ij
         zEjTdSGYOfcYovpX2LQt63vrAkhmBQ7zXSHS6OPBW2JJFXL0jGvFhjzDPhLo+OMDTow8
         c1Bw==
X-Gm-Message-State: AOJu0YzQxegX5rFPBFo4GDyaQOCHl2aPZ8vwZtZmiowONklt8T1JRnSE
	eirmsTnBfUcMLqTTsSVkrw==
X-Google-Smtp-Source: AGHT+IGYWMbdoqySBq1BzJwKmwLC+er3ZxwZeNittN/rvc4kzxvciK4fzqI0WtdhViUE8CGSdJwCsg==
X-Received: by 2002:a92:ca09:0:b0:359:9efa:3afc with SMTP id j9-20020a92ca09000000b003599efa3afcmr15686723ils.7.1700563033583;
        Tue, 21 Nov 2023 02:37:13 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id c2-20020a92cf42000000b0035b08887987sm987002ilr.41.2023.11.21.02.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 02:37:12 -0800 (PST)
Received: (nullmailer pid 1178554 invoked by uid 1000);
	Tue, 21 Nov 2023 10:37:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, a.zummo@towertech.it, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, conor@kernel.org, unicorn_wang@outlook.com, devicetree@vger.kernel.org, alexandre.belloni@bootlin.com, aou@eecs.berkeley.edu, chao.wei@sophgo.com
In-Reply-To: <20231121094642.2973795-2-qiujingbao.dlmu@gmail.com>
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
 <20231121094642.2973795-2-qiujingbao.dlmu@gmail.com>
Message-Id: <170056303072.1178458.6696948575673288527.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: rtc: add binding for Sophgo CV1800B
 rtc controller
Date: Tue, 21 Nov 2023 03:37:10 -0700


On Tue, 21 Nov 2023 17:46:40 +0800, Jingbao Qiu wrote:
> Add devicetree binding for Sophgo CV1800B SoC rtc controller.
> 
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  .../bindings/rtc/sophgo,cv1800b-rtc.yaml      | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.example.dts:27.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231121094642.2973795-2-qiujingbao.dlmu@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


