Return-Path: <linux-rtc+bounces-4616-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C58B171DD
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCA0D5847A2
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Jul 2025 13:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB52C3276;
	Thu, 31 Jul 2025 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FrtH5N8Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29077A94A;
	Thu, 31 Jul 2025 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753967915; cv=none; b=N2dr4MRyY2LADbYuLI4PaZuExdxm3Frpq1H1irnQYFP+e3YzYQW6XFTQrnkFOfa10+kE4L0nj8zvPNohMBE25VRcT2j+FM3QsmInKKqSFnhKaHqb+sSCc2oKYY4QVn06Rx8XbRgnRjyAW4FCwAeW6TrqHg6MUg1XGBrjZQUAvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753967915; c=relaxed/simple;
	bh=Setdk4P0LfxRRgUblhfUiMB1mpM6wOnPj1k9C7xJ+eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eg4fHW1dA1Ms0Rsu8qoTdIYg2zR0Cf6njgM/3Pv8DPkjEXDK9wgTTrY0uUFvrm97xsvsh3+Gs6xMJopGcAu/RxAh3fPldduAV1PSGD1bY8B6qvvoHJqeYfN/HZ2NGD7SOG354brQtcbUMEoq4MsPZoV2ZaUjsbrNlPg9D8VRkL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FrtH5N8Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AA9C4CEF4;
	Thu, 31 Jul 2025 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753967914;
	bh=Setdk4P0LfxRRgUblhfUiMB1mpM6wOnPj1k9C7xJ+eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrtH5N8ZTn11r98wDtyoPuCNbywhaLiKlTjNEgfpJ/MYE/ueVe5av8X9ILRQrhb16
	 mS3r96kKh9t0oR7lkViwtGeMY+rBqx2wELrNEo1Is+Zzk/zIiQSgRSH1IhYrFj7vzr
	 ORSi5DH0N6BqtvdXtfojBgAM7Bt3Qf/0P8fRxyRiqCRQgos2KjaMHs10fqj1AmLsTD
	 RZd3BM/J59xtxhiNcGN+hsTaClqOSrGzlznRRqhQLm0o4txNRQh45/nanuCwrWOkn+
	 oIVWx0Dn/xgMBcLcWWfp9FNqrOLMdgikCCaUDZoS27xf976zWdhGP7KDeD+B40oCC/
	 cuB42vd5zpd9A==
Date: Thu, 31 Jul 2025 14:18:27 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250731131827.GG1049189@google.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
 <20250726131003.3137282-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250726131003.3137282-3-elder@riscstar.com>

On Sat, 26 Jul 2025, Alex Elder wrote:

> All devices supported by simple MFD use the same 8-bit register 8-bit
> value regmap configuration.  There is an option available for a device
> to specify a custom configuration, but no existing device uses it.
> 
> Rather than requiring a "full" regmap configuration to be provided to
> change only the max_register value, Lee Jones suggested allowing
> max_register to be specified in the simple_mfd_data structure.  The
> 8-bit register 8-bit configuration is still used by default, but
> max_register is also applied if it is non-zero.
> 
> If both regmap_config and max_register are provided, the max_register
> field in the regmap_config structure is ignored.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v10: - Rename simple_regmap_config() -> simple_regmap_config_get()
>      - Introduce simple_regmap_config_put() to free regmap_config
> 
>  drivers/mfd/simple-mfd-i2c.c | 45 ++++++++++++++++++++++++++++++++----
>  drivers/mfd/simple-mfd-i2c.h |  5 +---
>  2 files changed, 41 insertions(+), 9 deletions(-)

This has gone from an in-function 11 line change to 50 lines and the
inclusion of 2 new functions.  As much as I _really_ appreciate the time
and effort you have put into this [0], the added complexity being added
here doesn't sit right with me.  How would you like to go back to your
v4 idea of providing a bespoke regmap_config for for device?

[0] Beers on me for sending you down this path!

-- 
Lee Jones [李琼斯]

