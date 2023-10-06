Return-Path: <linux-rtc+bounces-50-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 790237BBC89
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Oct 2023 18:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94AA81C209EF
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Oct 2023 16:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FDF28DBC;
	Fri,  6 Oct 2023 16:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFkTvMoc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFC4273F9;
	Fri,  6 Oct 2023 16:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89291C433C7;
	Fri,  6 Oct 2023 16:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696608982;
	bh=nn2PakBIGbgtsjEPpxAO4jVlLqjVjHADYSnUr1qUXew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lFkTvMoc5xPxQnjGQFbbukgR7nGvQnaMUmIi8cIFrTDFwzZVKr9iEZ8kf9UwtmkqS
	 JjVmj8vB0ZE3TTOhwWGNB1o+JGF1B090dzJEdIgroxf4E0ngIgy808gaNyUPH5DIJl
	 J26870g4clx/9i8PyhovxrsBJET6ud3yGuLTEpzfK6WP1sXVcDOKmAYFwmPgx7Hx42
	 TgUnvqo/j6K5BNN2TivJ1Z+rTg5nraUATk/swrNf592B9syT+5kdlaHuidRWPb9A8x
	 eVXAhvs+zO1q6xgZPse0VgS1i3yG6J3XpznXuO3teSMIwX7oX5V6lQddll6CHRjwHj
	 1rUD3xOytS4kg==
Received: (nullmailer pid 4022504 invoked by uid 1000);
	Fri, 06 Oct 2023 16:16:16 -0000
Date: Fri, 6 Oct 2023 11:16:16 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Komal Bajaj <quic_kbajaj@quicinc.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sascha Hauer <s.hauer@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Gross <agross@kernel.org>, Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, NXP Linux Team <linux-imx@nxp.com>, linux-rockchip@lists.infradead.org, linux-rtc@vger.kernel.org, linux-mtd@lists.infradead.org, Vincent Shih <vincent.sunplus@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Kumar Thella <sthella@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Anson Huang <Anson.Huang@nxp.com>, linux-kernel@vger.kernel.org, A
 ndrew-CT Chen <andrew-ct.chen@mediatek.com>, linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Lala Lin <lala.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Richard Weinberger <richard@nod.at>, Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Message-ID: <169660897594.4022464.17777045780008018792.robh@kernel.org>
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


On Tue, 03 Oct 2023 08:40:18 +0200, Rafał Miłecki wrote:
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
> 

Reviewed-by: Rob Herring <robh@kernel.org>


