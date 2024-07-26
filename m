Return-Path: <linux-rtc+bounces-1617-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7F93D6D3
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 18:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E181F2208C
	for <lists+linux-rtc@lfdr.de>; Fri, 26 Jul 2024 16:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E4517BB27;
	Fri, 26 Jul 2024 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="T89omwwV"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C803F2E631;
	Fri, 26 Jul 2024 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722011019; cv=none; b=cloNe7lEFdNFXIgynV2nLnMhNhgz373+EWxAXOslNk1KrZ+C6J8o4SrHAVMAoOIdd+J8XiGd33dA+BKTrWEjzWQdrjtOUmc7sPj47Px5NgUbYI90lrdAo2M+95IYSCpcxZKz43ljmiGH451FWcJtj1A1vmfGpotPiy2RK88G4DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722011019; c=relaxed/simple;
	bh=fyst8cps3xW58G8THZ+YW1f8Faj/jGupRNst6MykTNs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UiB3pVlOp65lVZZDTissvSAynTvvYz4KlUyyJmRJDSTihdU1xEOsvUn670ESTfXPkd6QWdkhVWHtYXK1PjLWhLfHdukretuEW8WNkYamfPnQzDXHSXYhh2k2iOtFYyEzCRpTjwUF7LF+pEIvMj6Zd0zMhWIfOxKV4kCDUUUwwRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=T89omwwV; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=41663bMFA4MJ9CK5rUQXGIVfpcilzT1W+csMGnpYlEQ=; b=T89omwwVfh59xYu5VR+dN2nEQX
	dK9ZaHd3xfexNMfFsajB6aWDwohmK72hGNicz1fn9+99oXeuo2aLacK85UC9icqs1g378R4qJ43y5
	KVncNahhEL5yGrgpeOOJ7+SkKUlsmxSzzo1hXmjmz4U1c5x7ChemYnlEfYrXclu15o8JKggBjo9Dg
	o1qF+Vz0JJX+q95ZbXY93JfHg40QPZc6xQdLl4XqUQ8CEnurrxWo9yRONIIqD/rfwBxNCXOwgnf+6
	0BRg6ZYaKE/xptx0Tg0J9e2aRGs9onh/Ys+xTLisWprb/RDnFpgJGe2hKUp4GKUdZiCIvx52v9Y4A
	ZW2BH6Eg==;
Received: from [2a00:23ee:1910:3d2f:6a4d:614a:18ee:5940] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXNj8-00000004G7h-1mz2;
	Fri, 26 Jul 2024 16:23:30 +0000
Date: Fri, 26 Jul 2024 17:23:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Jakub Kicinski <kuba@kernel.org>
CC: Richard Cochran <richardcochran@gmail.com>,
 Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>,
 "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
 "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2] ptp: Add vDSO-style vmclock support
User-Agent: K-9 Mail for Android
In-Reply-To: <20240726075734.1ee6a57c@kernel.org>
References: <7b3a2490d467560afd2fe08d4f28c4635919ec48.camel@infradead.org> <20240726075734.1ee6a57c@kernel.org>
Message-ID: <C24DBE80-D654-49D6-A021-E84F10238F86@infradead.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 26 July 2024 15:57:34 BST, Jakub Kicinski <kuba@kernel=2Eorg> wrote:
>On Fri, 26 Jul 2024 13:28:17 +0100 David Woodhouse wrote:
>> +`       status =3D acpi_walk_resources(adev->handle, METHOD_NAME__CRS,
>
>   ^ watch out for ticks!

Oops, that last minute space->tab fix after I'd already left home for the =
weekend was clearly not as cosmetic as I'd intended=2E Will fix; thanks!

