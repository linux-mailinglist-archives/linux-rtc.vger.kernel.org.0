Return-Path: <linux-rtc+bounces-2185-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A8999D508
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 18:54:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE269284583
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Oct 2024 16:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA2C1C0DCB;
	Mon, 14 Oct 2024 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iS8/1+Ff"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9281BFE03;
	Mon, 14 Oct 2024 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728924854; cv=none; b=YTFCm0DT2AZPc/sBbzie2NRZphOczn3ZU3IkJmcpcU1N/qH3xo2pc3KyffQ7zIcgIwbVS3hncMHOhO/u9hbsx8yl0f5q61BADcTw27fzc5ToVJsizuyIJwDONgfztrEX2Fd/woK+zkQTOZ9ctCS/dl58W8ox7Y6nCC0R4pPs3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728924854; c=relaxed/simple;
	bh=J1xh+KeiCiUEKcxI7/lL6ZOZWUFLYQ95c2233jGs85w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3hMUL7ObTUK1dkjELNaZK6jYAs7jEPBtlL7oFiS88l5022pfkUkZomsM+vzKKyfeP/wLP7AJTnkbPIMo/pBcnJm2kspUyDtLCIsw4acL1F8Jr/Wf6RU9o/WS3yVH+TgIu3DgV6l+DoXx1kn5A9JbxYGbnM5GqITT12Niis+ncc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iS8/1+Ff; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 547C5C0005;
	Mon, 14 Oct 2024 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728924844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzPbyORImSzImPqpC0hAEvFAttjRAmROKHtmKvXA2IU=;
	b=iS8/1+FfbwnGHg7nDvADC9E3N7sZkE7GFuq+J/lsAfk0iPR74oW9cQWH84oYsOLsvZH1yF
	MIMcwYag0Yzrr3iHa0ZeBDWm6Pe8uf+qwgnGRFbMDnfcWH4cUoK1ujnduU13UitQu4iUXZ
	aNGDyhurayD/hlK15VGMUsSjjUb+KoleQzFcLCIe39UwstIrrytKInyvWc6cEetX4TOM1X
	yPfsoULgOoKDawJ6Oor239xM7t1hPZaWMLhTNQOVPa2AagZlhu/e+pcxTMXLn/RfVG0Kvk
	k4Ekf+1Lef5uCNQIdUZ5RaLqB5Guy3kPgulFWQYTuJr4LJW/2YXTv3J+IWPjwA==
Date: Mon, 14 Oct 2024 18:54:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: pierre-henry.moussay@microchip.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Lewis Hanly <lewis.hanly@microchip.com>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: mpfs-rtc: Properly name file
Message-ID: <20241014165403e640f637@mail.local>
References: <20241011100608.862428-1-alexandre.belloni@bootlin.com>
 <CAL_JsqL=OJss3kudaQBx==g2zBiqtsbWJZ5oOFWJF-vLCQZ+yg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL=OJss3kudaQBx==g2zBiqtsbWJZ5oOFWJF-vLCQZ+yg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 14/10/2024 10:39:20-0500, Rob Herring wrote:
> On Fri, Oct 11, 2024 at 5:06 AM <alexandre.belloni@bootlin.com> wrote:
> >
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >
> > The actual compatible string is microchip,mpfs-rtc, not microchip,mfps-rtc.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> >  .../rtc/{microchip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml}      | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename Documentation/devicetree/bindings/rtc/{microchip,mfps-rtc.yaml => microchip,mpfs-rtc.yaml} (100%)
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> > similarity index 100%
> > rename from Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> > rename to Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml
> 
> Incomplete. Now next has this warning:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml:
> $id: Cannot determine base path from $id, relative path/filename
> doesn't match actual path or filename
>          $id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml
>         file: /builds/robherring/linux-dt/Documentation/devicetree/bindings/rtc/microchip,mpfs-rtc.yaml

I fixed it directly in my tree...

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

