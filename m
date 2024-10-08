Return-Path: <linux-rtc+bounces-2120-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273D995793
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 21:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDD3A1C24951
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 19:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6792139A6;
	Tue,  8 Oct 2024 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Y7poJ758"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7851E0DCC;
	Tue,  8 Oct 2024 19:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728415595; cv=none; b=g+siMHSmM/P65BZtDmLzq9TFDydnvcA6DwJkJOykH8v9y47Pa+OcGrWaZBlwJB9gEOlpC1B+joNLtoPAciNMSAmVFaBAJ5MKbiwg+xou2Eo4tui+9XDtRmUgF9VzpPy92CNAO/LIhoY0FxEj4PSYRmSCPWqsg/FygtDY+UCE+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728415595; c=relaxed/simple;
	bh=UN60g7ok2txVfjib6VFzxF/hYlvmRSU7ESVjdEIV/FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rIqIS/kFiXNJZBMlwMg88lZMSsdDm+gvIrIygIqEnVozj9pZB2R4B+EpT35CeW63Xc9QRBkj/WlJtJhskwChg0bbMqyG+4s5ZPLtQgHKqw+hF3swgQbeo4KwF56UT8YED0tpwaqZy6KhaYT71bDkDWiD9zTcMigKf27Mufzqf10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Y7poJ758; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FhQkehwGj9tY7Cfu+3fe0KEsL4p9cA3gfskuGZndKuQ=; b=Y7poJ7581kZPvGWRfvLw6odq0I
	oanEKm52hlcmfBdwCH7A7AGCcZQyVN+YeDXa4nMGgWOxWGs3+d9b8XHFgEgdZ4laRXfVpgKTizsIi
	DCk8WCL3QtSoNiA2daFRIuG9N5K0GxOGRBz3bAHU+MrNc/HBVDAeIdB5H1u+kixyLO7xbntHzo6n7
	KT7o1xj07cOfaQBTe3/On3T16SDifk4jA0ZYCjzzJ3Z8fePjVkeyZR/ikKYV3omW2pEbKfIyyxNnB
	TwyCn7CuZ4SLgsBMC59d0W21NuY19UDRZaVZ35lx12fO/LVZtJwRI2VOQK4hfm9XhWITt+SXdV37p
	yYIqLWpg==;
Received: from i53875ad9.versanet.de ([83.135.90.217] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1syFqV-0006zK-1L; Tue, 08 Oct 2024 21:26:11 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alexandre.belloni@bootlin.com, wim@linux-watchdog.org, linux@roeck-us.net,
 karthikeyan <karthikeyan@linumiz.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH v3 1/6] dt-bindings: watchdog: rockchip: Add rockchip,rv1126-wdt
 string
Date: Tue, 08 Oct 2024 21:26:10 +0200
Message-ID: <1988046.PYKUYFuaPT@diego>
In-Reply-To: <37e26b46-2f6a-4db4-b003-59088ef1dcc1@linumiz.com>
References:
 <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <ddca4051-0e83-4d39-8654-12210ffa5685@linumiz.com>
 <37e26b46-2f6a-4db4-b003-59088ef1dcc1@linumiz.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

Am Montag, 7. Oktober 2024, 15:56:58 CEST schrieb karthikeyan:
> 
> On 9/18/24 12:59, karthikeyan wrote:
> > 
> > 
> > On 9/18/24 04:46, Heiko Stuebner wrote:
> >> Hey,
> >>
> >> Am Donnerstag, 12. September 2024, 16:24:46 CEST schrieb Karthikeyan 
> >> Krishnasamy:
> >>> Add rockchip,rv1126-wdt compatible string.
> >>>
> >>> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>
> >>
> >> I think this patch misses some recipients because neither
> >> the watchdog maintainers nor the watchdog list is included.
> >>
> >> We'll need for them to at least Ack this patch, so they'll
> >> need to be included. Please check your scripts/get_maintainer.pl
> >> call
> >>
> >>
> >> Thanks
> >> Heiko
> >>
> > Apologies for missing them. Adding them in this reply mail.

I don't think that will have worked.

Ideally can you include Conor's Ack and resend only the watchdog binding
patch to the watchdog maintainers (and lists and me too please) .

Because just adding more people to a reply probably won't tell them
that some action is expected.

Heiko



