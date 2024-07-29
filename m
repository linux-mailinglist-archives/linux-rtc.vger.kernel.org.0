Return-Path: <linux-rtc+bounces-1631-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3493ED9D
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jul 2024 08:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC0E81C21852
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jul 2024 06:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B080E83A0E;
	Mon, 29 Jul 2024 06:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fxru4Y+t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F12119;
	Mon, 29 Jul 2024 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722235574; cv=none; b=G6ZSWRvNb4TUwWbKevNiY2qnR0s88mHU04S8uZvQUMjNM10hG13LEYTsHb82Y0TJzDPcUCA1kHVsK+aGsDxDLGjKPKJblpojnM6nQ1U5ZMCjiMUAgpHKrgUvfiO8HIaJXpcEHmHSbvuYDFY4Nt0dgR3KqKFuA3mEucpvBvzxni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722235574; c=relaxed/simple;
	bh=R3wogILUarLMuOKLK0lDpfm3PIGb/vJu4lEvZa0OeBM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=UQ9JftTsImWvYkkVtsDpE66x1SDp3MLHtbiTr7g+RbimHe9JR7mNeZKg5/EGYqFA3LroCuBb5NGTsKkaAspkDfvJsPtNZPSdBugbecpMqzlzuyGv8fsjZLCu/muA8JiSgFH4VIMo0cr43VL5M04I7rRMrt1bVRv3xLzC0fXxF+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fxru4Y+t; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R3wogILUarLMuOKLK0lDpfm3PIGb/vJu4lEvZa0OeBM=; b=Fxru4Y+toyFmdCw6icmB/YNWlv
	j9jVZ7bm1SbESqDXtPHmtxrXQAOQOE0H0oSCGedJ1I+Kc8/K3MyMnf2Pu4vsPR7LMk1BXMWKPUb01
	TmuScp7QY9dxgDUhr0TOehkRw/RxA6kQqBZKWWoG+yAMXxloOiUiS3NkCZcI/oXAYfDzOaRk4n+r1
	it7UJNTjsT6qv1P4Rh0fbB6HtCA9CHciNGmKxWIOvJWn6LAEitXfz1ga200CmJGS4uLQcKHRElUuM
	kUFWYuhQFhY3qQnO/g99i0aAQLE5YuhJvXFdEdXwcjPDfkRGI6tVlRU45gi05n64a/SPKI24bCNFj
	WWshRG+w==;
Received: from dyn-224.woodhou.se ([90.155.92.224] helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYK8s-00000004jfc-44xo;
	Mon, 29 Jul 2024 06:45:59 +0000
Date: Mon, 29 Jul 2024 07:45:59 +0100
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
In-Reply-To: <20240728111746-mutt-send-email-mst@kernel.org>
References: <20240725081502-mutt-send-email-mst@kernel.org> <f55e6dfc4242d69eed465f26d6ad7719193309dc.camel@infradead.org> <20240725082828-mutt-send-email-mst@kernel.org> <db786be69aed3800f1aca71e8c4c2a6930e3bb0b.camel@infradead.org> <20240725083215-mutt-send-email-mst@kernel.org> <98813a70f6d3377d3a9d502fd175be97334fcc87.camel@infradead.org> <20240726174958.00007d10@Huawei.com> <811E8A25-3DBC-452D-B594-F9B7B0B61335@infradead.org> <20240728062521-mutt-send-email-mst@kernel.org> <9817300C-9280-4CC3-B9DB-37D24C8C20B5@infradead.org> <20240728111746-mutt-send-email-mst@kernel.org>
Message-ID: <92D47BE5-4D57-4C4A-A250-20B9C9EFD862@infradead.org>
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

On 28 July 2024 16:23:49 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wro=
te:
>On Sun, Jul 28, 2024 at 02:07:01PM +0100, David Woodhouse wrote:
>> On 28 July 2024 11:37:04 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom>=
 wrote:
>> >Glad you asked :)
>>=20
>> Heh, I'm not sure I'm so glad=2E Did I mention I hate ACPI? Perhaps it'=
s still not too late for me just to define a DT binding and use PRP0001 for=
 it :)
>>=20
>> >Long story short, QEMUVGID is indeed out of spec, but it works
>> >both because of guest compatibility with ACPI 1=2E0, and because no on=
e
>> >much uses it=2E

But why *did* it change from QEMU0003 which was in some of the patches tha=
t got posted?

>> I think it's reasonable enough to follow that example and use AMZNVCLK =
(or QEMUVCLK, but there seems little point in both) then?
>
>I'd stick to spec=2E If you like puns, QEMUC10C maybe?

Meh, might as well be sensible=2E I'll chase up which of my colleagues cur=
ates the AMZN space (which will no doubt be me by the end of that thread), =
and issue the next one from that=2E


