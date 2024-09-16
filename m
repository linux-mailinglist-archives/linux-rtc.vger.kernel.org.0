Return-Path: <linux-rtc+bounces-1997-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDAF97A418
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 16:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A811F23894
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Sep 2024 14:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BE3157490;
	Mon, 16 Sep 2024 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tHWMNXDx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F415687D;
	Mon, 16 Sep 2024 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496799; cv=none; b=a7czZjZPU/4RIU2aavN/Q+Nb4oSrVlgTtrYGZdn3sgbCe+ejAwgrM+QZ5cSt7HpIlXKVTM99UeZy0mZWSybzKMmP3D2RgYOdlddmL2AQ701Vs7idU0zk8vwHUaJGr85GGpAszCBsqhfClslPJ9sPPUGYd5NFWEZ6fEQ5fNVc01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496799; c=relaxed/simple;
	bh=sdE/vlXA3Dv4BZnCEsNQTh5kC84YwuF1zvQmdGRZ21Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d6xY/r8Rvmysmc7R0WzwRU62GNZduvg7xtyuuEaL49bxtqmIAuYEl5tBQFjinFDkErNyvXZxY1GK6RYjbjLWUuGJ+wVcythvNsHNeIJLuDfybYObiv+vje0EqNDvYponu/8SEyWUi3mD3dVx6vTkpz47xA571L6PFobC/J9a0hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tHWMNXDx; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DfX2+Ab8IkMho2T+sds4RcOFof34oFEmvaQShESSX7c=; b=tHWMNXDxYJsp+gQT5Npy/xJx2d
	g4ruBQrtyviheDnr/ELd6FSBHE1lBTHmrzhMXqfjjYbUT8VLyfVYxrgTjj7oP8dTFOj0VODidfNwq
	mgIyzFz5e+D1kDa5QQaGue4i3K0m1+wb+xlOVnMhOig9z3XWdKoIOxsO51wY6Cmyr8tgLmknnMnOd
	C8CL7TqRHEcnr2V6po0PCSERqLv38DAHnhTjTsJyGP7XsRdqFLoMvnqEfSKySTQ3hKAmG7KHcg1DV
	VakCJRbQYhk7fdKVs3qKeAPQ+V+WPO76Geyb8ksHgz7V0E5VSnGFzdmLSiB6cjMNN5nvAXAvTsUVZ
	F+7SwmYg==;
Received: from [83.68.141.146] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sqCgK-0001Qr-J4; Mon, 16 Sep 2024 16:26:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject:
 Re: [PATCH v3 3/6] dt-bindings: rtc: microcrystal,rv3028: add #clock-cells
 property
Date: Mon, 16 Sep 2024 16:26:23 +0200
Message-ID: <2955009.e9J7NaK4W3@phil>
In-Reply-To: <202409161237568b626ad7@mail.local>
References:
 <20240912142451.2952633-1-karthikeyan@linumiz.com>
 <20240912142451.2952633-4-karthikeyan@linumiz.com>
 <202409161237568b626ad7@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Alexandre,

Am Montag, 16. September 2024, 14:37:56 CEST schrieb Alexandre Belloni:
> On 12/09/2024 19:54:48+0530, Karthikeyan Krishnasamy wrote:
> > RV3028 RTC has a clock out features, the clk out can be
> > controlled using clkout register, to consume the clock out
> > from rv3028 '#clock-cells' property is added.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

just for my understanding, does this mean that you expect this change
to get applied together with the others?

No preference, just making sure I understand :-)

Thanks
Heiko



