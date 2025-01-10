Return-Path: <linux-rtc+bounces-2868-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51AA08A37
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 09:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87873A8D65
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Jan 2025 08:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED47F2080F4;
	Fri, 10 Jan 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT5d4gWK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4F2080E4;
	Fri, 10 Jan 2025 08:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497959; cv=none; b=NqMxh5vsRhq/lOHZxvCsoWTxR7GgL3ByZPWdAGchk03LvfcIsCT0IWu4MgMqkUQUaz1rex9OOih84eCCVORENIAW2JZOEcXMPq8EyrvPyPuZkxPZqPGLpRfS/wJJU6KJ2ZAQZmuTEP5aAWYEjKXI/LhkJtfEkViotQQhnrKYBU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497959; c=relaxed/simple;
	bh=F7+8NuyA/ln6XdARA4a7br1cybemtP9BIJnW3t6gANI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IeO71+4AoWu49rY3Y4UiTTDWo06d0DOg1YT6djl3ZyDBg+691PY5eIovikpK3gNAHSmmTdevPr5ZXm5ktV4WW+TTTJ3PeeFz0NR/d1mldRyC5gy8BDglNyAq3C2oL1ZMc5LwkTNyVO/zT4F6rhbhEiCbAo5TDLtoHl0qD1sQJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT5d4gWK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72473C4CEDF;
	Fri, 10 Jan 2025 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736497959;
	bh=F7+8NuyA/ln6XdARA4a7br1cybemtP9BIJnW3t6gANI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NT5d4gWKVu8YH3rFsV0MnUQXWT8fcan9bXB/KMe8UsfywAylFJFdnkwoXODoH5Sqw
	 f1OVOic4ofmb48ZLhqbPZBD5D94ChY6TEwjuMCvyimBDdCCciHKR+afXsNnpJyMvGu
	 VfNpe2UIvDSP+P766Rt1ijqKfbOI/YC+xvkJA+KSbb4D3Rnc8yh4UFpKHQ07WUci9e
	 sWS4+QwK7EVD1n+7UvWhLxhOISEchhzyOJlQafQ0rtVlCxMZvwzevRMJkLA0SZnELv
	 KO0xr0v5UPYoFquQ4zm+g5eKQxLTmj5J/76xlXGsowK/aUd8Qfu4fL4RqTU0NcdIHx
	 Er1fyGFUtnZ/A==
Date: Fri, 10 Jan 2025 09:32:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: PavithraUdayakumar-adi <pavithra.u@analog.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Add support for MAX31331 RTC
Message-ID: <unxvs6dwmbhj5z5knhmeyhf2rugtzfz27puoczv6andj6fpja5@ir4nhyie6vjx>
References: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-add_support_max31331_fix_3-v1-0-a74fac29bf49@analog.com>

On Thu, Jan 09, 2025 at 03:59:56PM +0530, PavithraUdayakumar-adi wrote:
> This patch series introduces support for the Maxim MAX31331 RTC.
> It includes:
> 
> 1. Device Tree bindings documentation for the MAX31331 chip.
> 2. The driver implementation for the MAX31331 RTC
> 
> Signed-off-by: PavithraUdayakumar-adi <pavithra.u@analog.com>
> 
> Changes in v3:
> - Address review comments

Which ones? What exactly changed? This has to be detailed.

Best regards,
Krzysztof


