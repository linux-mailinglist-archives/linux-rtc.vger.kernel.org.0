Return-Path: <linux-rtc+bounces-44-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0977B60D2
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Oct 2023 08:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 96D2F1C20847
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Oct 2023 06:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45CF4C7F;
	Tue,  3 Oct 2023 06:34:15 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB91111E;
	Tue,  3 Oct 2023 06:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39E1C433C7;
	Tue,  3 Oct 2023 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696314855;
	bh=Ryqz7zCojcMrEL8UuOL0v/jyNiV/Tvh9g3eXU1LCU2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AAlRSjy+ZPVXdvA0otoocH+MR4mkmlZiwM0Qq6ROZJEyMmGSGE+A6KbaKGSezpi7l
	 ZTCzUND2LpxuvzOLyksaUm3ZDB1hgsSeDh4FinK07Ps+wIPBZYy6/s52s3OAShctPi
	 oSJivSz33iUYk+CvBwUzAN2lo/UMZ6SwbE3KgL3zWAjTv+OI6flkEJpNWxSZsWcqOF
	 Wva207ke7oNtBOrUUwVzyft4pGJ7y8gF3mfcv1xM/yoh27FwGVvUGCSW8xLT0ui+MJ
	 whJmGLWJ9L6giK/J1zon59LVlMfeQlHhGpfbnQlvBThtC8UATKTjTXR52pTYAYcEc7
	 yekHR3gUSzE5w==
Received: (nullmailer pid 3548862 invoked by uid 1000);
	Tue, 03 Oct 2023 06:34:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Christian Marangi <ansuelsmth@gmail.com>, Hector Martin <marcan@marcan.st>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>, Komal Bajaj <quic_kbajaj@quicinc.com>, linux-rtc@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mtd@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Vincent Shih <vincent.sunplus@gmail.com>, asahi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Anson Huang <Anson.Huang@nxp.com>, Andy Gross <agross@kernel.org>, linux-rockchip@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
  Richard Weinberger <richard@nod.at>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Sven Peter <sven@svenpeter.dev>, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, Kumar Thella <sthella@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Kevin Hilman <khilman@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, linux-mediatek@lists.infradead.org, Lala Lin <lala.lin@mediatek.com>
In-Reply-To: <20231003050355.1631-1-zajec5@gmail.com>
References: <20231003050355.1631-1-zajec5@gmail.com>
Message-Id: <169631484962.3548819.1223779643388796546.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Date: Tue, 03 Oct 2023 01:34:09 -0500


On Tue, 03 Oct 2023 07:03:55 +0200, Rafał Miłecki wrote:
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
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/rtc/nvmem-deprecated-cells.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.example.dtb: rtc@740: False schema does not allow {'compatible': ['amlogic,meson6-rtc'], 'reg': [[1856, 20]], 'interrupts': [[0, 72, 1]], 'clocks': [[4294967295]], 'vdd-supply': [[4294967295]], 'resets': [[4294967295]], '#address-cells': [[1]], '#size-cells': [[1]], 'mac@0': {'reg': [[0, 6]]}, '$nodename': ['rtc@740']}
	from schema $id: http://devicetree.org/schemas/rtc/amlogic,meson6-rtc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/rtc/amlogic,meson6-rtc.example.dtb: rtc@740: Unevaluated properties are not allowed ('mac@0' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/amlogic,meson6-rtc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231003050355.1631-1-zajec5@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


