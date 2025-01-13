Return-Path: <linux-rtc+bounces-2892-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFF2A0B136
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 09:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566C71881C56
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 08:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24CDA233D9E;
	Mon, 13 Jan 2025 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="imDm6zXc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF3233D98;
	Mon, 13 Jan 2025 08:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757318; cv=none; b=hzMIw5UDttRpZJnNVZ/acWZTF7Ocjs4ziEqx6I7sABJqIOluBGTwHumpq3IIJuXKNLL4HE351RaDeH7xRRzc5X43S5yGK5IKnge7IYtrLX1wjTbo8xwSplKqLLB9xjDQHKr5/wj+eK7AjOnTT+8JFgY0zncmwgoTazPJvEfqb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757318; c=relaxed/simple;
	bh=/w4cGWEdvtF1jTVRXD4TLqnRhH1cGPm/56RjSTYR5J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWI4jctNAJfCUj3GTdooYMU2F23pkDE58fpjN8t15A9VewJIsA657t6DbDwH45WsWJ6Gd3yqOvBzvbIAe+4wB2qi4X9N7J6uoJfY5RXzeaS8/aU+lGvJ8J+Qj+ae2pkUp+6FTmcB2xBUi2hXw/waCuD7GoBAYy6TgcZ0REN2ZMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=imDm6zXc; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3A5760007;
	Mon, 13 Jan 2025 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736757312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IWmQ8MiO5uYzUdLoRcFdPB79dMwYGmi5sgzBTCSL1xw=;
	b=imDm6zXcGeyK8CdpOD6BaZf7kxmdzcJeNpnUoDjsv0XgjwCt6nLR5C6B9LOQ/46cv6PW+G
	9YoI6J5RH2eNTS2tNQgNzoGcm0eCeY94qocuqWVTeIexXsjbSin87Q1M5NWT7gnh7HuQXV
	VeyJ6BNHMO8PeXBcZo/mRNuGRZdWs9qv1+0+iOnu5OAOS1eis9eYRQkwg39oaFaAKUcjrV
	XGPe9qeYctouHHziW8rD184O3Tl74imxb+ub99PEHwAAf10MgdzX0lLyTv8dO32EirGKC3
	TosGQbuxezNDN30qL+oGO+oTxiWH8Q2HiHQjIv/xC0uLQ030z5xy3LC+wOGPaA==
Date: Mon, 13 Jan 2025 09:35:11 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: rtc: mxc: Document fsl,imx31-rtc
Message-ID: <173675730309.1496086.6217131350465680601.b4-ty@bootlin.com>
References: <20250112134027.1013213-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112134027.1013213-1-festevam@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 12 Jan 2025 10:40:27 -0300, Fabio Estevam wrote:
> imx31.dtsi uses the following RTC compatible:
> 
> compatible = "fsl,imx31-rtc", "fsl,imx21-rtc";
> 
> Document 'fsl,imx31-rtc' to fix the following dt-schema warning:
> 
> 'fsl,imx31-rtc' is not one of ['fsl,imx1-rtc', 'fsl,imx21-rtc']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: rtc: mxc: Document fsl,imx31-rtc
      https://git.kernel.org/abelloni/c/6758bd0692e2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

