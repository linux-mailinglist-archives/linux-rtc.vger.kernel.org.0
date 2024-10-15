Return-Path: <linux-rtc+bounces-2204-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847F99F893
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 23:05:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1274281368
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Oct 2024 21:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D54A1FAEF2;
	Tue, 15 Oct 2024 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttInMuNZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4FA1F81AE;
	Tue, 15 Oct 2024 21:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026294; cv=none; b=mZCy3xc/lPDCM2X132k0xEeA7g0km2480D0tMTRhn6AWlqL1NbmzSTp5PHxyGrPqU1LmzPSo9jupZy0Gf5LGgrpBSIPefeW3Q2KIP25QCoDNH2CP2ApMXEn45X//abDM66rHu3yYx+fnBbUoRLm0mJko0EGMSEBsqm6tx+O2I2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026294; c=relaxed/simple;
	bh=BUYL9DCxlqZBPQ7mv1XPuRWD5L3cs0jleTVBGzzkhXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQ9R7b1Nlx605hG/V/7vWmb7psl9AxCTb7InhKCK37NZB08N2tXsECQlta8bfuyFhSxCjl0F0yegEZFlz+uZxpjgLAOfIN1WAGca2vZ9X1C8x4Www4TimbCmFaF6bW4TdvMlLV3U1NwT1R+8Jzq8P0xfj5uu0TG5c3mxnwt7Fi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttInMuNZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63711C4CECF;
	Tue, 15 Oct 2024 21:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729026293;
	bh=BUYL9DCxlqZBPQ7mv1XPuRWD5L3cs0jleTVBGzzkhXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttInMuNZhQyT9mQjpBo4HjV5z17nWbUD2dkhzKu3h2EinXQY2ATAebbICxfx/2YCN
	 jAEZwj0XPLuLlgnqmUbIy4tOGdpdZkI2yGezk7iU3Sqrsu9R2L26xTRDOUh5yKvsPF
	 4Yh17X3w44S59uwHVfiRWnyuDwjNoMajzq5UrPNUy8fBy/BWug6K9Nzfa0m3uRlPU1
	 1iTw1uoysxPkNSnmApk6pglWHHrhNmNds/NLKI45iPoW/w2jtjR6BNJC/8+0HnCs8/
	 cdBhs7reBwKmaNPMeDhlaDJaLXbBDsn7KaHiKq8X7jD+7KfhgtJYvr61Azy2Iqm/Q/
	 vPBDqV8F5TzVg==
Date: Tue, 15 Oct 2024 16:04:52 -0500
From: Rob Herring <robh@kernel.org>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v2 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <20241015210452.GA1942395-robh@kernel.org>
References: <20241015105133.656360-1-ciprianmarian.costea@oss.nxp.com>
 <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015105133.656360-3-ciprianmarian.costea@oss.nxp.com>

On Tue, Oct 15, 2024 at 01:51:31PM +0300, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> Add a RTC driver for NXP S32G2/S32G3 SoCs.
> 
> The RTC module is used to enable Suspend to RAM (STR) support
> on NXP S32G2/S32G3 SoC based boards.
> RTC tracks clock time during system suspend.
> 
> RTC from S32G2/S32G3 is not battery-powered and it is not
> kept alive during system reset.
> 
> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  drivers/rtc/Kconfig    |  11 +
>  drivers/rtc/Makefile   |   1 +
>  drivers/rtc/rtc-s32g.c | 778 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 790 insertions(+)
>  create mode 100644 drivers/rtc/rtc-s32g.c


> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 8ee79cb18322..a63d010a753c 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -158,6 +158,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
>  obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
>  obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
>  obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
> +obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
>  obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
>  obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
>  obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> new file mode 100644
> index 000000000000..d6502d8bf616
> --- /dev/null
> +++ b/drivers/rtc/rtc-s32g.c


> +static const struct of_device_id rtc_dt_ids[] = {
> +	{ .compatible = "nxp,s32g2-rtc", .data = &rtc_s32g2_data},
> +	{ .compatible = "nxp,s32g3-rtc", .data = &rtc_s32g2_data},

Considering the data is the same and g3 has a fallback to g2 in the 
binding, you can drop this line.

And really you don't need rtc_s32g2_data because there is only 1 
possible value. But maybe you know some differences which are coming 
soon? Then it's probably okay. Up to the RTC maintainer though.

Rob

