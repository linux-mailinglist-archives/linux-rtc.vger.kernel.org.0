Return-Path: <linux-rtc+bounces-1414-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F14B491B243
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 00:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C7481C22780
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Jun 2024 22:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6781A2572;
	Thu, 27 Jun 2024 22:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HGuGbMVO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59281A255F;
	Thu, 27 Jun 2024 22:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719527713; cv=none; b=QmVxC2osuu1HecOn6jmxB+cl2b6R5zP1Rbvw7yzy1Ki7WxvxafuAbSDbzowAyQ5M0JH5yU/DnVNoETH6hVrNBYoGcDtoPBL6wEnx40vW3AvWOZo0cMPycazenx8kQTSk9sMau/jJ621gQ3EO7zk7LQCIVVEeMJtMse5HRlU2X1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719527713; c=relaxed/simple;
	bh=9CuEBe6zrHcEN9lEnP7x5jJ7DI8h0/UB+6346Z0mPGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhUfYfTWfQmJRsMctduDXyVT2FSClqJVv9Vj6F8X1iZ5otlUOXs2ESKMy8ApYjGlkska2uKx2yrcJAuy1CzJnb/gyN7XVE5Myn316YVMfhSkh8A+81J4QodmKIRFih1qvB43VAImir3mmrQehy83ptPDlddgZLOOJlUjCG16zIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HGuGbMVO; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 014EFE0003;
	Thu, 27 Jun 2024 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719527704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8mKAZqsaxRvdEmL/mKpUjcOj85cPifIRu9RTJdJ3AXc=;
	b=HGuGbMVOVUE4re88qsg+OWO+lFU1KxgLh4QNbkeTlc8drgBNFCY9CsIOyFfwa0Wh+QBoRH
	nObpKSki8QKgE1Li9GWnS3Z4l3NTUbQQNn61g0+226+SBbwGzV3Q1o4jy70gocGq4x2ThI
	smM7rQCZWWM6WhlQV91TzWXNRWTIn98ffIJfPJ78n/G4Ycd+eyQf//rkUB1j4lSlnYSi8Q
	sQMmBAxaWU0v2O1M/3iixBQfmFhv+bPdYAw1PGKCOM87/s7VJf3398qsve91mwxMdhYmUi
	qPuXhGrsf++rpIg1JllNMvwBY0jtJcdUZvcq7SO0hQMJe4Dz+rZxao754/D6cw==
Date: Fri, 28 Jun 2024 00:35:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt
 to yaml format
Message-ID: <171952768200.522224.7730380973476273215.b4-ty@bootlin.com>
References: <20240528184359.2685109-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528184359.2685109-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 28 May 2024 14:43:59 -0400, Frank Li wrote:
> Convert dt-binding doc "rtc-fsl-ftm-alarm.txt" to yaml format.
> 
> Change example's reg to 32bit address and length.
> Remove unrelated rcpm@1e34040 in example.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Convert rtc-fsl-ftm-alarm.txt to yaml format
      https://git.kernel.org/abelloni/c/840ac611fbbe

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

