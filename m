Return-Path: <linux-rtc+bounces-1629-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709E93E54E
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jul 2024 15:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1EA61F2154D
	for <lists+linux-rtc@lfdr.de>; Sun, 28 Jul 2024 13:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D8B4AED1;
	Sun, 28 Jul 2024 13:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="flT8Pjof"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFD1B86E5;
	Sun, 28 Jul 2024 13:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722172041; cv=none; b=oNYSKlNjHkwIafsyJYF8CYbnUIkVvBV72JbAjdDCR1BQJm3jdxVxCJIKnTelKGz9Ctu71y/7O5pmQZtaLw+lz52CSv9QhGrF56XN3aiEt5xW+TYdStJTosr3bNXjCVY+0Wnnv8ZmPivY+Y+Sjai80ei3DNClf62qBQJ+DY4K4is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722172041; c=relaxed/simple;
	bh=FDZHoL0SYBD5C6coY9/igQ8KrkajIrhZ0dId7u51w5s=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Rjg7Or1nKg4r880EVThSL/dZnJQGmVznDlhSSbxavuOBupmIDUp0om9ZvzyU/EZzSC7ycLJdpYBEn+2sDnGPXwjo/WmiW8eg9pUZIpfHD1Zuxl5Oi+7hzhMUOLR+oxmQMGiOXyf4LyaMQkkdM6NtBfintVuyRolKClp2kHbLWSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=flT8Pjof; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FDZHoL0SYBD5C6coY9/igQ8KrkajIrhZ0dId7u51w5s=; b=flT8PjofU7rvlmZR2KAxcTVcgP
	1g/5ut9QnbzMunNfEATZz0IMzkliBkloPrrBvR3BGEVHuY1LayI7GgF7nXEFzG7aKYMIBGVhmHbMN
	c5KQa6IrgPAdMz5acaJCV5NlVf7/A8Qg+cE1ePBPZ6MALimflCeXIp2C8SJ0Y9y2ouFedE6C2bODo
	nloYEiHQk75OPKKogDsi54vrp/QSHnMjKxqpNm2b6F19DNFwvabKrGCAW9CeqoNohX2b0/KnxWVl1
	c0idAJ4zTvu5CDwvR89bpQju7bkLceoJLPeTylfrxhIZNa+yFmCH8Y50jbtxK9bakx8KLhvj2AdT3
	vq2EmdcQ==;
Received: from [212.241.248.254] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sY3c7-00000004cYv-07UE;
	Sun, 28 Jul 2024 13:07:03 +0000
Date: Sun, 28 Jul 2024 14:07:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>,
 "Mohamed Abuelfotoh, Hazem" <abuehaze@amazon.com>,
 "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 netdev@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] ptp: Add vDSO-style vmclock support
User-Agent: K-9 Mail for Android
In-Reply-To: <20240728062521-mutt-send-email-mst@kernel.org>
References: <20240725012730-mutt-send-email-mst@kernel.org> <7de7da1122e61f8c64bbaab04a35af93fafac454.camel@infradead.org> <20240725081502-mutt-send-email-mst@kernel.org> <f55e6dfc4242d69eed465f26d6ad7719193309dc.camel@infradead.org> <20240725082828-mutt-send-email-mst@kernel.org> <db786be69aed3800f1aca71e8c4c2a6930e3bb0b.camel@infradead.org> <20240725083215-mutt-send-email-mst@kernel.org> <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org> <20240726174958.00007d10@Huawei.com> <811E8A25-3DBC-452D-B594-F9B7B0B61335@infradead.org> <20240728062521-mutt-send-email-mst@kernel.org>
Message-ID: <9817300C-9280-4CC3-B9DB-37D24C8C20B5@infradead.org>
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

On 28 July 2024 11:37:04 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wro=
te:
>Glad you asked :)

Heh, I'm not sure I'm so glad=2E Did I mention I hate ACPI? Perhaps it's s=
till not too late for me just to define a DT binding and use PRP0001 for it=
 :)

>Long story short, QEMUVGID is indeed out of spec, but it works
>both because of guest compatibility with ACPI 1=2E0, and because no one
>much uses it=2E


I think it's reasonable enough to follow that example and use AMZNVCLK (or=
 QEMUVCLK, but there seems little point in both) then?


