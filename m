Return-Path: <linux-rtc+bounces-5246-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1305C2C3F0
	for <lists+linux-rtc@lfdr.de>; Mon, 03 Nov 2025 14:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8ACA534971B
	for <lists+linux-rtc@lfdr.de>; Mon,  3 Nov 2025 13:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4212749FE;
	Mon,  3 Nov 2025 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JZw19uBW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB42222BF
	for <linux-rtc@vger.kernel.org>; Mon,  3 Nov 2025 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762177868; cv=none; b=cgUT2mKOvvNN3EGdsDgqBZlUlN+ICgKQnBLhOQ1YDP1l/TiGaRcJPTNaNdBcOMUpT/gRDV6fjK+Ch4MpHMO58b1vUEG6OkDpm9Ggnd5rlJDXvGeKrJb+ZqzqCbJOe1foDsKUWNUAmC4wjSKiiPIP0kydaxDQczLO7nQkny2TzW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762177868; c=relaxed/simple;
	bh=TxvgFbg/Vb1N8ju1lnv4lDKIlNnF76z1sLY8MZjKXBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXBIUZsGH54nKQJBmKdb8mMX5wLyuVhrF7/XvyssPi5JbT5NGqBk57CFKNjxhKrvPzMLa44KmzCxnBJ7q3eR1xdU1qJElBcSdmMI7ZGRjUGN4yUbPT2S62/jFcztnrseLL9oXCpnX85IEbiLnwaITnmsSIusGJ/GbDxkOAlponk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JZw19uBW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1C4FBC0D7AB;
	Mon,  3 Nov 2025 13:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B41A560628;
	Mon,  3 Nov 2025 13:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4AE5710B500C8;
	Mon,  3 Nov 2025 14:50:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762177860; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=/m8rdeLKaA4WSLoHrSxLT8BCucA4Ov5kAuCE4vkVBmg=;
	b=JZw19uBWN9H93Zlsnaefmm1F3+OYAFHdSbmgwNCA+91R26VmQzMnCXVehwgiPLqCAmiJi2
	vppKyryVq4Bntsq6+sFD7VY119Q5rbRRUf4fvRljrlRqj/v4/dszd8A0vf5QEOmkJG9Uk0
	XuqNWp4spnvX2W2PXRczW1d/uYV1iE7kDrrzpJ54WVg3lnCeXb1R9YQVa3/vcaVFEDAD1I
	KBmNwg+ruYPk9iAIjju4tDk0lllhBs9ogOeUTESd+Dix/EJbwRqI1vAwcu/hf88AOFQSH5
	FErrvO24KOlB522dg/CgtSOS+t/fM5ndhrvfAwcIEbBLb/h6VRl/KP+Oz6C5wg==
Date: Mon, 3 Nov 2025 14:50:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: claudiu.beznea.uj@bp.renesas.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/4] Add RTC support for the Renesas RZ/V2H
 SoC
Message-ID: <176217780890.386697.14373281518311620724.b4-ty@bootlin.com>
References: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103121848.6539-1-ovidiu.panait.rb@renesas.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 03 Nov 2025 12:18:44 +0000, Ovidiu Panait wrote:
> This series adds RTC support for the Renesas RZ/V2H SoC.
> 
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - it lacks the time capture functionality
> - the maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - it requires two reset lines instead of one
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
      https://git.kernel.org/abelloni/c/8056f175606a
[2/4] rtc: renesas-rtca3: Add support for multiple reset lines
      https://git.kernel.org/abelloni/c/d034c9ca6a47

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

