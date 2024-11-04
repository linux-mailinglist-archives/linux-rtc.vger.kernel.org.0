Return-Path: <linux-rtc+bounces-2457-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D529BBF17
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 21:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C747280E35
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Nov 2024 20:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2F31F7094;
	Mon,  4 Nov 2024 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="brrJZD4G"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533B1192B91;
	Mon,  4 Nov 2024 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730753745; cv=none; b=A0AIEsxAOC+fvfNPqerCpZIgl72H47XM8ph3vxo1ZTKW42/7fRbN8YesnEUSYI/flxX5hsLGoiqg/AjG+fLqAYbIi1yF26BYNrCTdDPDR5UwR4W5j3bnQV77JfrtIigX9lp0T8OLRZklbV/7ZYAN1hvDnrQXeq5g+/UTyjWxjvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730753745; c=relaxed/simple;
	bh=w/BwBLYfkwC6ASNtsfliDcKXZSmaBz4dLFMzkH88W2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VakuopKBZkyhMi7qaVKKLvr6pJYxm7Xt5nqt0/nxCAa/sh45JA6vS/JprJ7/xSG8x7s/MqCcETekcJBX29Xeu26fb6kZztEEna9r58G9zBo0RJ+qAMAyjiRdQvrVg9Vgv0yToh6tcJT98x5S+ZwYw8rr9BJjdhjkk/U8kEk3Dro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=brrJZD4G; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6AA081BF205;
	Mon,  4 Nov 2024 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730753740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nbox0dlasLe1pqTORk1m61pBMBl2JDQYGoux2ZohVCk=;
	b=brrJZD4GS3iZTjnuuKgSpZ1Vt0SWtjSsJOoi3SNyzcw4Qr5fXybiVriwJQIF6xLsxmk6mZ
	LQnlgPlSL4gYG+txVLaBuZ6Gu+vVbYlcz99CznupJDU3pq/Pyg+O7/8BwIsv4mehsjAUxW
	931Dv2+zIbnNTtlCY4pQL+qI0IbqqzyVscswIJVm3ntGKuTJ4jx7x1c09qgSOzhEZMgw8V
	cfygLDrcLDQpELLHCF4sR31C4PdKQeqjSJijC3DTB3Lgxcw+U2A4Liw8xAr2NKt3beMqQS
	i88CDqtn4AYlN32iIYowxf4PPM/6OXJFurpupRPqqd0dgrlTRDqA327/Ba931g==
Date: Mon, 4 Nov 2024 21:55:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: rtc: mpfs-rtc: remove Lewis from
 maintainers
Message-ID: <202411042055393b9cf4be@mail.local>
References: <20241015-surcharge-caucasian-095d1fd2fa27@wendy>
 <20241104-immodest-finishing-354430b8e386@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-immodest-finishing-354430b8e386@spud>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/11/2024 19:06:08+0000, Conor Dooley wrote:
> On Tue, Oct 15, 2024 at 07:52:05AM +0100, Conor Dooley wrote:
> > Lewis hasn't worked at Microchip for a while, and IIRC never actually
> > worked on the RTC in the first place. Remove him from the maintainers
> > list in the binding, leaving Daire.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> > Noticed him in the CC list of your resend, figured it was worth removing
> > him.
> 
> Could you pick this up Alexandre? I've got no contact info for Lewis, so
> I doubt you'll see an ack from him...

I will, I'm super late on the RTC patch queue.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

