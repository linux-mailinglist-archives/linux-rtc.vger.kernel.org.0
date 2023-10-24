Return-Path: <linux-rtc+bounces-122-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06C77D53E4
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Oct 2023 16:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AB90281A43
	for <lists+linux-rtc@lfdr.de>; Tue, 24 Oct 2023 14:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67002C870;
	Tue, 24 Oct 2023 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D92C85D;
	Tue, 24 Oct 2023 14:25:05 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04E212C;
	Tue, 24 Oct 2023 07:25:03 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1e58a522e41so2967782fac.2;
        Tue, 24 Oct 2023 07:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157503; x=1698762303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTENRnFDH/MiSBA8uB23f0CHV3Zm50OBvimHwqLqTLY=;
        b=eakaDoXDmjV8CfpH00qM2sTG9LQeJRyNZWNxcVv1Zabz0fJT11nPtNeCfSlAN21+0s
         iGg4GVObMn5lxEZjcj1vfNHVhbiSNPViuFhLx1ibtlzr59K/VUh5AI0BOyS73gzHHWR1
         ZwCf9e2I/cdazdbX5lxfXxEd/OMufOeF4BQqCUmueWwpAYA5LJ6zPfOxMeLr8YC8IPsx
         gdefmWO5XRwzIAHP1JEI7D6YpLLGLYYDjTurnZ3dhTXPMB+HBBQ+2bOxL6x5USvV3QNj
         IJ5HjXWyeoQv9tptsccsiys7lzI188RkLbQFziIbZtBGBbMu3vKLse6sCvWB31bfqTRd
         E+2A==
X-Gm-Message-State: AOJu0Yy9FtfmJWyPHLBFEW14JgCg5hAt/DCIX6WIYPWfO0QaWnf7gIbH
	iZePnWJD+sbgcLYxlPAjtw==
X-Google-Smtp-Source: AGHT+IFi+wUzpHfgZ8zfKt641YNAo4P94oG7imu28ijkctLr8rSHz5f9MF1hyEAgXwXwercbvcmRUQ==
X-Received: by 2002:a05:6870:1f0c:b0:1e9:bbfe:6457 with SMTP id pd12-20020a0568701f0c00b001e9bbfe6457mr15080276oab.6.1698157502801;
        Tue, 24 Oct 2023 07:25:02 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870d38700b001e9a7280a30sm2187892oag.0.2023.10.24.07.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 07:25:02 -0700 (PDT)
Received: (nullmailer pid 3693654 invoked by uid 1000);
	Tue, 24 Oct 2023 14:24:57 -0000
Date: Tue, 24 Oct 2023 09:24:57 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, 
	Komal Bajaj <quic_kbajaj@quicinc.com>, Kumar Thella <sthella@codeaurora.org>, 
	Keiji Hayashibara <hayashibara.keiji@socionext.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Message-ID: <20231024142457.GA3684864-robh@kernel.org>
References: <20231003064018.7502-1-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231003064018.7502-1-zajec5@gmail.com>

On Tue, Oct 03, 2023 at 08:40:18AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Support for old NVMEM fixed cells was deprecated in favour of
> "fixed-layout". It's still part of the nvmem.yaml though and may be
> unknowingly used by new bindings added without much of analyze.
> 
> To make it more difficult to accidentally support old syntax move its
> binding to separated file with "deprecated" in its name.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Fix path to nvmem-deprecated-cells.yaml in amlogic,meson6-rtc.yaml
> 
>  .../devicetree/bindings/mtd/mtd.yaml          |  7 ++++-
>  .../bindings/mtd/partitions/nvmem-cells.yaml  |  1 +
>  .../nvmem/amlogic,meson-gxbb-efuse.yaml       |  1 +
>  .../bindings/nvmem/amlogic,meson6-efuse.yaml  |  1 +
>  .../bindings/nvmem/apple,efuses.yaml          |  1 +
>  .../devicetree/bindings/nvmem/imx-ocotp.yaml  |  1 +
>  .../bindings/nvmem/mediatek,efuse.yaml        |  1 +
>  .../nvmem/microchip,sama7g5-otpc.yaml         |  1 +
>  .../devicetree/bindings/nvmem/mxs-ocotp.yaml  |  1 +
>  .../nvmem/nvmem-deprecated-cells.yaml         | 28 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/nvmem.yaml      |  9 ------
>  .../bindings/nvmem/qcom,qfprom.yaml           |  1 +
>  .../bindings/nvmem/qcom,sec-qfprom.yaml       |  1 +
>  .../bindings/nvmem/qcom,spmi-sdam.yaml        |  1 +
>  .../bindings/nvmem/rockchip,otp.yaml          |  1 +
>  .../bindings/nvmem/rockchip-efuse.yaml        |  1 +
>  .../nvmem/socionext,uniphier-efuse.yaml       |  1 +
>  .../bindings/nvmem/sunplus,sp7021-ocotp.yaml  |  1 +
>  .../bindings/rtc/amlogic,meson6-rtc.yaml      |  1 +
>  19 files changed, 50 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-deprecated-cells.yaml

You missed allwinner,sun4i-a10-sid.yaml and at24.yaml 
(arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts). Maybe we want to 
fix the latter case because at24 will continually have new users.

Rob

