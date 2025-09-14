Return-Path: <linux-rtc+bounces-4896-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B798B56C65
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 23:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAE331896E02
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130B22E6CAE;
	Sun, 14 Sep 2025 21:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sTyV6vcQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395B2E612F
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757884659; cv=none; b=aG2//gKEbeUNDn+SAcLUFYbcGib+nH6//xeXdCdihBdR0Qvm1W2k015y4jd+GOrLHq6MN0GM5r2XO3hoMG18mjxkGx+A8e8omuYcyTl9TJ4ThneOEUuRZZwApvCF4V1INoAy3Dpe1H+WDmRyilkHxPTmNDDYyZDQE76iuaoSJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757884659; c=relaxed/simple;
	bh=eS4EkHT9wQ8dbFeDRO9liwQC9Uky0mZDAzalZEYEZJc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxT0If4pOvxd8SApustMAtOwyUY3wfBWTjjzoS6y5t3Qmr1ljsuozbG99t0ulV68RzNxroeFt2p0Y3lBE1ni7E/ZqnebBih1o+z0Sj3/OaZMPWtT6M1qOnN8qNEys7OcY0zEpRm0bs8vwpSX/0fvXAHXeiTW0/TolkkrX5maJoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sTyV6vcQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD4871A0A15;
	Sun, 14 Sep 2025 21:17:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 830106063F;
	Sun, 14 Sep 2025 21:17:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91E20102F2A7F;
	Sun, 14 Sep 2025 23:17:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757884655;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=bwgYGLVw4FvwSrXLDhUaGBwyd0Ch8i1Emb7X+v26uqM=;
	b=sTyV6vcQ7aNeiJCqjTT936B7vdGy4WQNWApnGTKPcAvq33b9pTGYDOqPtLP3F7MkcqtcJm
	hE9fG1ocfnFKfXQMG76eqQrKMNORE+t9YvpCu7MBm++2HSX2heXFqKt5095bCKjTfgsB9m
	umbnvx+lcyASn7p1fied5B3bziruG6oPy/ZKOKwXVtKsxHW9eyZD+fD7zc0cywVyjIuhSt
	bleGV4f3Zj5nlNDMtT9nXCQEsYX6dT+zWr4oACeugEFWcr2lAoD/b5vvJdjtx/IsZn4G2/
	Pmpb0Kn9Suq/uVoVJYVOIcrVZt935hd+Q1AE+xQ/fdK4l0zU9keEDeKNATbZhw==
Date: Sun, 14 Sep 2025 23:17:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] rtc: s3c: Drop unused defines
Message-ID: <175788449952.388732.603913346670882108.b4-ty@bootlin.com>
References: <20250830130024.142815-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830130024.142815-4-krzysztof.kozlowski@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3

On Sat, 30 Aug 2025 15:00:25 +0200, Krzysztof Kozlowski wrote:
> Drop defines for S3C2416 and S3C2443 SoCs which are not used anywhere.
> 
> 

Applied, thanks!

[1/3] rtc: s3c: Drop unused defines
      https://git.kernel.org/abelloni/c/06625ab00682
[2/3] rtc: s3c: Drop support for S3C2410
      https://git.kernel.org/abelloni/c/1e41547c2041
[3/3] dt-bindings: rtc: s3c: Drop S3C2410
      https://git.kernel.org/abelloni/c/063544dad4a7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

