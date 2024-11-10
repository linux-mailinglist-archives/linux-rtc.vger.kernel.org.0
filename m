Return-Path: <linux-rtc+bounces-2480-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A699D9C34F2
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB9F61C21364
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED751156F55;
	Sun, 10 Nov 2024 22:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kdvy7Trt"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B7814D44D;
	Sun, 10 Nov 2024 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276230; cv=none; b=DrxmWNwvEGDhEgTzIBm2VNEFeUf9i2I7CtovSS+F1X9m1DebXukjY4PDH4z12mvA659613KoRB+WXWYiTCi1srCXH+mG9qy20daTKaSoMD4OjgtPPAGeoXHcMn5nKswow5jLtQMJS3vb6tY/ZDoM2wHwfFZXM/80g+7MrN+VX9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276230; c=relaxed/simple;
	bh=NumHuVVfpzh7bPNy9N9f53Fu53MS/eFwlngLaZKY1KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgDSSpPNRjPkK8YONCJmUgLLy5CzytkXnSqC99O65tSnnewxTABYds+BJSeOKeiD/exn4ZE1Vmra8ULyTgI3M2Mp8XDNPNk8gXwztPcKsoi83uvg3Hs4L5GguRooP7cNX6b8bRwVdTVoTN4PQ52xpBo7ou7+4A099azHqjWQP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kdvy7Trt; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6557C1C0002;
	Sun, 10 Nov 2024 22:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAGwvVFRKlbCFZ7shXGEWHn9/7Jrvo5yXwZOZQc11eI=;
	b=kdvy7TrtfYK5tut2KQ4fJMZoGsuhaFrNyoHOQFZo0zFqp9JZbEntq4A+Cy+FDh/oBdxnc4
	4xW0L7mePs80+fLyMQkHrch6EYSXDtyYLWfcGIfW8TreBNdZr9KQlax2n1x6HO1KMwncQf
	toYlr29jgCELriiuPqrOZaSy1FLCOh2LI1OXQscDQycU8yVjcBP8eOZQBCsEDqRqeyet9D
	8WLyVKJ7NJSWg4pFKu4gOY0VCr0RRg6s6Ezg/rQDOcan9Z2MNW3QKZpcQGMFxUnvqbOX+z
	Le5Mc3hpehC7xVgW+vkaaVqI7qI5KdYcIoWAdKMhLAt248e01MImB3tUum71kg==
Date: Sun, 10 Nov 2024 23:03:41 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?Q?T=F3th_J=E1nos?= <gomba007@gmail.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Makefile: Replace spaces with tab.
Message-ID: <173127618342.3020900.9527518962182188685.b4-ty@bootlin.com>
References: <20240930-rtc-makefile-spaces-v1-1-e936e0a7b02a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-rtc-makefile-spaces-v1-1-e936e0a7b02a@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Mon, 30 Sep 2024 10:57:40 +0200, Tóth János wrote:
> Fix a style error.
> 
> 

Applied, thanks!

[1/1] rtc: Makefile: Replace spaces with tab.
      https://git.kernel.org/abelloni/c/5127135f738e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

