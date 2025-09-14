Return-Path: <linux-rtc+bounces-4899-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7ECB56CED
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Sep 2025 01:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C5CB189A8C8
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACBF21C84B2;
	Sun, 14 Sep 2025 23:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mOY4mIDB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4FD245012;
	Sun, 14 Sep 2025 23:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891916; cv=none; b=soG25ti9gJSR0gWWmBpTk/4bfJeATTC1dzBKGpNJoI85gdOhWYPsx5fQqKQ/lGeWugSAZhB+SgLL0ZFdtZMg70jdiGh9iCPSXaRRtLJTmM+O2lKbWnMW71X/NIKKqAvveVWdd4g6ljsQwbpC2jV8DPb2pLb1aSYqGzC0QD29fj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891916; c=relaxed/simple;
	bh=2IWg//jCjtsX9qHw0VjDSYx8k19/PSkdXOb66HtGiWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqIpXw0axmdFHtduZdVFwl+e+ypRxeH2m3Cl74NLNnvNv2BAZPaVH0eg5GlfC4H+hZ8W6jNl//t97MXbc0zZ+DM8NFWRqEgxtVp/Oj1JDjLwbhXOHVLRhyZVqjrOavUc9i5uVsN6pCfTqmuc3t1YJ90fRcE33C+b5MRqSqd1PAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mOY4mIDB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A74A9C6B39E;
	Sun, 14 Sep 2025 23:18:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DFF056063F;
	Sun, 14 Sep 2025 23:18:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA37E102F2A84;
	Mon, 15 Sep 2025 01:18:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757891912; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=72rkRSHnXrDfVGpJtg8XpXzUfH4idTJGntMTFwn8mv0=;
	b=mOY4mIDBtBP1Pj0aSq/qstAqjLq5DeYuPIZL0F4753ZAGBV6kF9TOlBQ0HhqQ0ffV86vxl
	lhPU6ImHSKeCOeRF0ypT6ZLplYIVCqAPBkcV5eQzBF3SxOo/zP1VNuOA3ka5Q+sDYDTGp4
	l2fsXZphuiBKMk4HJYehB8aTi3kbq6ApGDCys8WrHDKDCcSo4mSoZTPnNS/Slx6ac5y9Pq
	z6iPzKnEsVoFNaMEA3FTdvugfoXx8xIHPGprgvL9FDIzzVfxmzV7e+3XYgUxYZHlPlTMQ3
	3x2h9DDARW4ecf41xHz9f/UE43YshBopQ8J/vQ6cuSx7e1MjNNM/8DZD5HFvHw==
Date: Mon, 15 Sep 2025 01:18:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Fix Xicor X1205 vendor prefix
Message-ID: <175789183742.411954.3595794825615282645.b4-ty@bootlin.com>
References: <20250821215703.869628-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821215703.869628-1-robh@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 21 Aug 2025 16:57:01 -0500, Rob Herring (Arm) wrote:
> The vendor for the Xircom X1205 RTC is not Xircom, but Xicor which was
> acquired by Intersil.
> 
> 

Applied, thanks!

[1/2] dt-bindings: rtc: Fix Xicor X1205 vendor prefix
      https://git.kernel.org/abelloni/c/0552f7c67469
[2/2] rtc: x1205: Fix Xicor X1205 vendor prefix
      https://git.kernel.org/abelloni/c/14552d291e50

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

