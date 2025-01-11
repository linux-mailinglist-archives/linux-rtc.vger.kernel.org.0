Return-Path: <linux-rtc+bounces-2877-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113FA0A2B4
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 11:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA1C166477
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Jan 2025 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12B218FDB9;
	Sat, 11 Jan 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo0JTgSd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688C18FC83;
	Sat, 11 Jan 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736590920; cv=none; b=bR3v+hB38yEFx3HdkawmcyNxk/6y2ncdBDyxd3nTeADVBF2XbfRDuMy0O4p4wmFvhK7ehy6ZfnKnWCKKYQmKCRFRiEa6znUpH/XpLpaesvN9FYsKOSooA2MLqRO5LAPcgar0QMQ7pTPtTnIM+Lfw+zyHCgGAOVD+LBYWbnA+fcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736590920; c=relaxed/simple;
	bh=jv0gWdrf8te54p/j4SX/mQzXdskf6SaI603fpsActY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoFUiowu+MsaurB3rya5utgCv8yjUDV2M5qZtVEFIxP5eABQI6TPAECgtraKq0PaasLjUyK4caaKLPB1y6tfhg1gpRWvSR24VNdL7E0j8IO87OB4A+hvPKAd/ayrI+D6CMhqJo+FBQOnaMEhFzdhT3EgXHB+Q/KqoFlWafpWV1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo0JTgSd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89FF1C4CED2;
	Sat, 11 Jan 2025 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736590920;
	bh=jv0gWdrf8te54p/j4SX/mQzXdskf6SaI603fpsActY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uo0JTgSdxhZPKClFHAckW+ecKgABfm6xLTuKiqTVfoikt9WVtV8Hj5n6FwZPFdp1z
	 HvupiuP/QKgTGZ1RKpSe6NlmH4HxNmQxRrT1xdkX1+kapjRISsuCSaFzi9Dy57S3/s
	 Y4J7/DGost5WmpH3jsPJTJO/EnaABGNKP5sT6p/qwx2EfIoPhNbyR/YWhVmP4cLCjJ
	 ipp5OqAVfu+I18zLM8oI9A+nTguCJY3sBW/t13vNG/YCTkqoWBrou8pumFr34nCX6b
	 17lSJ9zwqM3fdA5YTGJ8FlHolH+Mxvkwa/XzqKl45Fb+brPHTnuzVK4QOkTO90cdY1
	 wPI2Y/dDugXmw==
Date: Sat, 11 Jan 2025 11:21:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v1 3/7] rtc-rv8803: add register definitions for rv8901
 tamper detection
Message-ID: <l4ayyscyth2zha62mrxcgkte3db53z4kqrnpvrorkq7f53wrwl@4nzqsohbzn2u>
References: <20250110061401.358371-1-markus.burri@mt.com>
 <20250110061401.358371-4-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110061401.358371-4-markus.burri@mt.com>

On Fri, Jan 10, 2025 at 07:13:57AM +0100, Markus Burri wrote:
> Add register definition and string mapping for rv8901 tamper detection.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  drivers/rtc/rtc-rv8803.c | 122 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 

There are no users of this. Don't add dead code. Probably you wanted to
add it for some usage, so add defines/structs WITH the users.

> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index 50fbae9..a4f2f53 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -58,6 +58,53 @@
>  #define RX8900_FLAG_SWOFF		BIT(2)
>  #define RX8900_FLAG_VDETOFF		BIT(3)
>  
> +#define RX8901_EVIN_EN			0x20
> +#define RX8901_EVIN1_CFG		0x21
> +#define RX8901_EVIN2_CFG		0x23
> +#define RX8901_EVIN3_CFG		0x25
> +#define RX8901_EVENTx_CFG_POL		GENMASK(1, 0)
> +#define RX8901_EVENTx_CFG_PUPD		GENMASK(4, 2)
> +
> +#define RX8901_EVIN1_FLT		0x22
> +#define RX8901_EVIN2_FLT		0x24
> +#define RX8901_EVIN3_FLT		0x26
> +
> +#define RX8901_BUF1_CFG1		0x27
> +#define RX8901_BUF2_CFG1		0x2A
> +#define RX8901_BUF3_CFG1		0x2D
> +
> +#define RX8901_BUF1_STAT		0x28
> +#define RX8901_BUF2_STAT		0x2B
> +#define RX8901_BUF3_STAT		0x2E
> +#define RX8901_BUFx_STAT_PTR		GENMASK(5, 0)
> +#define RX8901_BUFx_STAT_EMPTF		BIT(6)
> +#define RX8901_BUFx_STAT_FULLF		BIT(7)
> +
> +#define RX8901_BUF1_CFG2		0x29
> +#define RX8901_BUF2_CFG2		0x2C
> +#define RX8901_BUF3_CFG2		0x2F
> +
> +#define RX8901_WRCMD_CFG		0x41
> +#define RX8901_WRCMD_TRG		0x42
> +
> +#define RX8901_EVNT_INTE		0x43
> +#define RX8901_CAP_EN			0x44
> +
> +#define RX8901_BUF_INTF			0x46
> +#define RX8901_BUF_INTF_BUF1F		BIT(5)
> +
> +#define RX8901_EVNT_INTF		0x47
> +#define RX8901_EVNT_INTF_VBATLEVF	BIT(3)
> +#define RX8901_EVNT_INTF_EVIN1F		BIT(5)
> +
> +#define RX8901_BUF_OVWF			0x4F
> +
> +#define NO_OF_EVIN			3
> +
> +#define EVIN_FILTER_FACTOR		125
> +#define EVIN_FILTER_MAX			40
> +#define EV_READ_MAX_LINE_SIZE		96
> +
>  enum rv8803_type {
>  	rv_8803,
>  	rx_8803,
> @@ -66,6 +113,81 @@ enum rv8803_type {
>  	rx_8901,
>  };
>  
> +enum evin_pull_resistor {
> +	no = 0b000,
> +	pull_up_500k = 0b001,
> +	pull_up_1M = 0b010,
> +	pull_up_10M = 0b011,
> +	pull_down_500k = 0b100,
> +};
> +
> +enum evin_trigger {
> +	falling_edge = 0b00,
> +	rising_edge = 0b01,
> +	both_edges = 0b10,
> +};
> +
> +enum evin_buffer_mode {
> +	inhibit = 0,
> +	overwrite = 1,
> +};
> +
> +struct cfg_val_txt {
> +	char *txt;
> +	u8 val;
> +	bool hide;
> +};
> +
> +const struct cfg_val_txt pull_resistor_txt[] = {

Why all these are not static? Where is the header exporting these?


Best regards,
Krzysztof


