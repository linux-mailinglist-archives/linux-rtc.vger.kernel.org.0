Return-Path: <linux-rtc+bounces-4894-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB79B56C60
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB5A01896D58
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 21:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E8E2E5B02;
	Sun, 14 Sep 2025 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cQOmKQK/"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F522E03F5;
	Sun, 14 Sep 2025 21:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884634; cv=none; b=jn5CvsKRgzm/whLP2kUFm6jFev3qevPSXW30gs/NRPEzfB0WizwcxK16ZkoDRfTj3tDBkS/MQ+ksDgGFZb82oCnB5n9iaWq2Xuc88U1an/H73HyUhwOhmNvtKVWveRAvDAhlZ+NfXwSOsJQQ870sOj337g1CUrP8io3QYWCd0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884634; c=relaxed/simple;
	bh=URdhwSzTVTr6jnbDNqiV173BojDqOvJ98BtN7nxNUbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XL5O4lLXYctnYb6vBgtpFRE8g5RTgKdpFo6rNZMhq8yixN09lelFCAIt/aUZ9FV72xP0c99ycY8AdOF/VSu8EJ0X6y/f5FfOwQ0yCuFzIERgts5ii4PJxACR0AAxzi7qqtUT7uTTrQw6sqNfG/RmZCuYTKrzVy4XcHizssQXKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cQOmKQK/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2FD751A0DFC;
	Sun, 14 Sep 2025 21:17:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04FFE6063F;
	Sun, 14 Sep 2025 21:17:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A8A8102F2A78;
	Sun, 14 Sep 2025 23:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OkqbEDTG/+GAW4UlfVPaLCa1gjibhe38pdOw5DtxKK8=;
	b=cQOmKQK//9unzznVxjZPY72Zq0diePDB8AuvMrj3OXfD/HfDUApsWJISmMkBYgmBv4cwBn
	sG1znEXphFFz0pigi9i0E8BvWMVhbCqz9LbUuy53IshXA20/Kh/4VFQoxT44CKVuB/flr+
	F2KO86gDTQ+fl+zRmsF8NTh2eP/znv5okt658EIjTmV7kAG5g0qLqWBOftb8428nsNu+V4
	f1MOZIDU81GO06zfta415cjMvLnhWexlyMPf7Cq+ljLOq+lsXFmwT9qvrjGhjedhMhc0D1
	GbLtOuxXxH3E3Stn5gA7BrxcFANuZP2lJYa1JHnR3hUZuEenbMa0gAnSVcs+yQ==
Date: Sun, 14 Sep 2025 23:17:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
Message-ID: <175788449951.388732.3384121989400255394.b4-ty@bootlin.com>
References: <20250827193356.78368-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827193356.78368-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 27 Aug 2025 15:33:55 -0400, Frank Li wrote:
> Add compatible string dallas,m41t00 for dallas m41t00 RTC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
      https://git.kernel.org/abelloni/c/ab2849666022

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

