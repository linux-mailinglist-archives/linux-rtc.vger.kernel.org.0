Return-Path: <linux-rtc+bounces-4732-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFF7B2CDB5
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 22:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 893C01C401D5
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Aug 2025 20:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0C63101D2;
	Tue, 19 Aug 2025 20:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRp7A+/w"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8725742065;
	Tue, 19 Aug 2025 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755634653; cv=none; b=gzUc39m8CI4KCOPWUKwIhVOz+16ycg1fBchE9acqn9GvNXLX1j77Gq18Ibk3KuIryZFDew3NYOLt6odxrY1NeETZOuwe+BTZSj298OmSbl3UcTpIkxANjrsjrgFrUUVkJG5QCsNQZWXAZGgWvXBGLpFIXLVPDgOmYn4lLS/gthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755634653; c=relaxed/simple;
	bh=U3q6ToLedU70bZtEW12+5dJwu9UAwqYJ/UGCU6LWzSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke0jy8abry7xMVaZh1JY8pKelD/21zoFBShJYMH7eRCujo0lJHex7qG7WWVmWwlAyB2n33NOvQaHwcugrxj3EBFaVY6MGajI+nqgF/jypI67LKsD8Qp9JrfTHJOsETxsmers6/NZJynCwQl9C2yG6VaXM/JcP+QSL+ZKof0pjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRp7A+/w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE99C4CEF1;
	Tue, 19 Aug 2025 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755634652;
	bh=U3q6ToLedU70bZtEW12+5dJwu9UAwqYJ/UGCU6LWzSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRp7A+/wRv7ggXzPyAsPMR83RBwwR2BGDqN+WXMkAITJvfTJ3lku62QcIAgoib+/N
	 PeylRYfP1DU2pi5hCGbkzN4M101W6GHSVsNWX5MXUIySBw0Yjeeb9PpUE6Q7YRwaXb
	 5/wgn6b9aBFaYNiqXrQCVqtyI7291RqbqEwKYPMffM0kBSHsvE2enA+VIrTHv5CbzX
	 /sX5xEZHMM9znosbNs6s8uw/AJ0IH3syrY1v9xM2dmCUY3oDplXgtCNn8GOcXhX+gm
	 e+XaOPjPLBiuzPwG84m8tt5beyZxjiN+tJV/j9ZaFXUSD85xIikBHV8iH0sVDLzBSx
	 r5T2UwPckIltw==
Date: Tue, 19 Aug 2025 15:17:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev,
	Lee Jones <lee@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>, Janne Grunau <j@jannau.net>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rtc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 1/8] dt-bindings: rtc: Add Apple SMC RTC
Message-ID: <175563462607.1254097.12905994195694572424.robh@kernel.org>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>


On Tue, 19 Aug 2025 21:47:53 +1000, James Calligeros wrote:
> From: Sven Peter <sven@kernel.org>
> 
> Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> but most of the PMU functionality is abstracted out by the SMC.
> An additional RTC offset stored inside NVMEM is required to compute
> the current date/time.
> 
> Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/mfd/apple,smc.yaml          |  9 +++++++
>  .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
>  MAINTAINERS                              |  1 +
>  3 files changed, 45 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


