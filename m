Return-Path: <linux-rtc+bounces-2002-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D0197A948
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2024 00:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCB11284F23
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 22:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CE1158A2E;
	Mon, 16 Sep 2024 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="k0zO8q7S"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC211DFE1;
	Mon, 16 Sep 2024 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726526328; cv=none; b=Cocv9Pj/UEQ+hX22WEv3QCqcMU2SvG8sTr8QsWA4WWq11zsOjRLCNR34Vb/DN67jJEkBd3b9uHZl99cB1n2/PP4OpJj7DixCntYzZ0Y2+vsnc9z6tDegJv8dGxYPWQ7rfQNTd5XbH+NuDNGewQ7tGJNgJVEHsx0qnYmP7HS9N10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726526328; c=relaxed/simple;
	bh=YbAYe0oOBAtRgDdUM6HGKye8GRVg1ONRWGQevcTax+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NRyE6hex3Ou+aWPKrZLyqzoj/zIaU8Q86J9dnQeLx63GxVcjK2U7guAtGexdjkI1NGxQUqQ0YnTQQVryE0pvhVA8RV4XhAWJ4pqral529jyfZ/YTDzDl7KGTq82vWWE0A1DKwXukMc56AHGNCMPRIPqkrMmrIRJ5lQMZXJsNoy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=k0zO8q7S; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zFh+9m6bFt3yYPy5J3eOxOrUjNZGpq4euBHAABmwVps=; b=k0zO8q7SKxTLeYly004Mi7yqY3
	glGoj/l8uUO8qwaZmuBCnf3/NFouVzClQcl6FTauS3dwHQoDqKl5tkGVNS0V/GSumMVCOhOis4A0S
	3Ko82rO0PR3BBecXgQCGvBY0HrmYVPp8AYeA9956gOSETARzKRuK/Bke5wNIs9A5SaBgVpWZfMhiz
	yceYTgliTGaepu0/VcmFDV7Szm3UCmwyQBRVOKgUjcr1BYg34BYjOfDGyz+er6xe20QmPB5uLi015
	4HuuRINmzNF2c9vI6M42Q22lCDsZGx+3pOGZL2ZGXbkkPx0ju4P0f76I2KqnOThn0gkUn+U2oLt+e
	offU7DUA==;
Received: from [213.164.25.30] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sqKMa-0003Pj-Mf; Tue, 17 Sep 2024 00:38:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028: add #clock-cells
 property
Date: Tue, 17 Sep 2024 00:38:30 +0200
Message-ID: <8425812.T7Z3S40VBb@phil>
In-Reply-To: <20240916143407734d133c@mail.local>
References:
 <20240912142451.2952633-1-karthikeyan@linumiz.com> <2955009.e9J7NaK4W3@phil>
 <20240916143407734d133c@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Montag, 16. September 2024, 16:34:07 CEST schrieb Alexandre Belloni:
> On 16/09/2024 16:26:23+0200, Heiko Stuebner wrote:
> > Hi Alexandre,
> > 
> > Am Montag, 16. September 2024, 14:37:56 CEST schrieb Alexandre Belloni:
> > > On 12/09/2024 19:54:48+0530, Karthikeyan Krishnasamy wrote:
> > > > RV3028 RTC has a clock out features, the clk out can be
> > > > controlled using clkout register, to consume the clock out
> > > > from rv3028 '#clock-cells' property is added.
> > > > 
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > just for my understanding, does this mean that you expect this change
> > to get applied together with the others?
> > 
> > No preference, just making sure I understand :-)
> 
> i was actually wondering how this was going to get applied. I guess that
> if you are planning to take the rest, you can also apply this one.

so we were both wondering the same thing :-) .

For some other watchdog binding Guenter suggested the binding patch
to go with the rest, so I wanted to make sure your Ack meant the same.

But of course I'm also fine/happy with you just picking up this rtc
binding patch for the rtc tree :-)

Heiko




