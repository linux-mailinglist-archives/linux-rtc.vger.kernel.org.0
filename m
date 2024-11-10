Return-Path: <linux-rtc+bounces-2479-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB0A9C34ED
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 23:03:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8FC02816C4
	for <lists+linux-rtc@lfdr.de>; Sun, 10 Nov 2024 22:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB1C158555;
	Sun, 10 Nov 2024 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bdu5YPKa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E7213D276;
	Sun, 10 Nov 2024 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731276215; cv=none; b=AueIL0j3K5b5EAQGwPSPrhgCd3ghGOi0xVyd/1xq7TUcmKvlv8hgOBDIlZfLvMLUYAIJ8CuWZXoIU+z5S+abPfv7GpS1biSNIiRzzppO33yrFswBZRa8WTUu27naxqnJMDA5YYKVcj2GYk+m/ipEDbNGjNzgru1yuUHcjMJbR0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731276215; c=relaxed/simple;
	bh=fO1gub1N+BbSpS/Zj6wD2NJGQZjQ0FM3M5SXM5L+23o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owSo3nnn0hGEcsg+XxmVzgo3/AZWHxMnnHagE6iJUxU4Fxp14vGiA+cILDyDJqZE5LKMaLf/nVUZma535CP9bK1DA4l9jYPIbvGv3wu2B3GoaZK+1vi0/D9Rg09cKWU7j5/z2otteOHuk9eEKMJfRQpms/3K8JBCOsjXRQP9hTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bdu5YPKa; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9C011BF204;
	Sun, 10 Nov 2024 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o086+Lp8a1ZWCj/M3C7pbaE6vRo8SwiVy9QrAdM92PY=;
	b=bdu5YPKah1qq+Dx+DSfrGfbwXox+8s1kTxr8hIWUzmmhXUbfV5F14up+bFyMiBe4ep1y0D
	shC1hEYSD9/sjfhnwDQq+ERCJJ6DGojBJazvCpZNAQpvs3VKZ8rQzdrN59VAi8e65MVRyI
	gY2Ef7XEWfvfD1hHgDpXAw6f7lTBwlHzkDpr/DLjZKeot8Ly8SXCFCt3FD+4cYoe0GbOny
	hok5lCo1ZRNBQ0h4UbtOE3zF2biFAswA5E4gdGjR8ovRLQ4R+DLOzVUp6jqZnmHE/zx4ps
	IVvtV+KCoZif8tBqo1eXRdnZclP6kBerAJiRywmWBl/vSluJKF+JZnyJwrvMuw==
Date: Sun, 10 Nov 2024 23:03:30 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis
 from maintainers
Message-ID: <173127618341.3020900.5986296592063084729.b4-ty@bootlin.com>
References: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 15 Oct 2024 07:52:05 +0100, Conor Dooley wrote:
> Lewis hasn't worked at Microchip for a while, and IIRC never actually
> worked on the RTC in the first place. Remove him from the maintainers
> list in the binding, leaving Daire.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: mpfs-rtc: remove Lewis from maintainers
      https://git.kernel.org/abelloni/c/d93f8ac23b50

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

