Return-Path: <linux-rtc+bounces-1524-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB41932698
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 14:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 609021C2171F
	for <lists+linux-rtc@lfdr.de>; Tue, 16 Jul 2024 12:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA2F19AA42;
	Tue, 16 Jul 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HUhFCbCx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D71991D4;
	Tue, 16 Jul 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721133166; cv=none; b=kUHdXD8DXCFSZCJ2qxbu1ru0zAJ0FwAhhSV+SSeoa5Ud7OrcyHjfQE4w/kmJLZy0b5ynQGqOUD/Em7YSYFq3RP8UMYzqFvCET3nqcm1bT4N9LXfl1aiusf0tLNgGlrfz4R5IxcC/bLz8IZvm0Vn/M4vWHImUoO5VWL8iDhUxrqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721133166; c=relaxed/simple;
	bh=pIaGDgIPn1RkSG3S4gNRvlKDZuOR2m7qNGyMbFeFaBw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HRHHey0mRYBGQBMaGG4QLZQrngcsmpnqVG+x+YzSRMWl1enmqi1aCnxgO5QVGMQ2AFIAHFAAb2uMysx5gHSbC0HzK7t0ygEbUfoTPXGzfXeQJOPQJZ+XS75gOCENihoqRye7AbBAI3KKCyT7PXYvAigcCD/CyuPKIWfLxD0S9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HUhFCbCx; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pIaGDgIPn1RkSG3S4gNRvlKDZuOR2m7qNGyMbFeFaBw=; b=HUhFCbCxxO2O7trQKKBZU716z5
	aR2jjJdEcONiiwl2owyirfMJPyFi2oyoP4SGPANW+ddVi57IkYviI0BIqrMOWOdVbHU7lWwHso4+y
	Qy0VwdVg22UdQ7MsBfyRRNQXLJ5lnib7a/zEOWn8xnYIsOCwJqzxshAF8l/HlKqfmO+Tc0TraQgtF
	ytML3yO5HpNe/A8j6ovesLNBYW1BnnMxj8mDF3B7PXCOvdpYwEcZLnbN3+XSF6pRVsMHGB88TVCR1
	9JtEQJNUCCiTWwmEZq+1rtPt2HGwupqlFoNipkuGbRvXeH5JRbKDVrEV3JTPk0/bQb9eNenFTCVeu
	rcHF+c7A==;
Received: from [2a00:23ee:2468:1b84:edcd:8de9:5f89:1a4a] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sThM7-000000022Mx-1So8;
	Tue, 16 Jul 2024 12:32:34 +0000
Date: Tue, 16 Jul 2024 13:32:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>,
 "Chashper, David" <chashper@amazon.com>
CC: "Christopher S . Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 qemu-devel <qemu-devel@nongnu.org>, Simon Horman <horms@kernel.org>
Subject: Re: [RFC PATCH v4] ptp: Add vDSO-style vmclock support
User-Agent: K-9 Mail for Android
In-Reply-To: <9f132922-2bf7-4749-b8c7-4c57445f9cde@opensynergy.com>
References: <20240708092924.1473461-1-dwmw2@infradead.org> <060f392c-7ba9-4ff6-be82-c64f542abaa1@opensynergy.com> <98b20feebf4e7a11870dca725c03ee4e411b1aa3.camel@infradead.org> <1c24e450-5180-46c2-8892-b10709a881e5@opensynergy.com> <1ca48fb47723ed16f860611ac230ded7a1ca07f1.camel@infradead.org> <9f132922-2bf7-4749-b8c7-4c57445f9cde@opensynergy.com>
Message-ID: <DD886A0D-B8E2-4749-AB21-7B26A4B70374@infradead.org>
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

On 16 July 2024 12:54:52 BST, Peter Hilber <peter=2Ehilber@opensynergy=2Eco=
m> wrote:
>On 11=2E07=2E24 09:50, David Woodhouse wrote:
>> On Thu, 2024-07-11 at 09:25 +0200, Peter Hilber wrote:
>>>
>>> IMHO this phrasing is better, since it directly refers to the state of=
 the
>>> structure=2E
>>=20
>> Thanks=2E I'll update it=2E
>>=20
>>> AFAIU if there would be abnormal delays in store buffers, causing some
>>> driver to still see the old clock for some time, the monotonicity coul=
d be
>>> violated:
>>>
>>> 1=2E device writes new, much slower clock to store buffer
>>> 2=2E some time passes
>>> 3=2E driver reads old, much faster clock
>>> 4=2E device writes store buffer to cache
>>> 5=2E driver reads new, much slower clock
>>>
>>> But I hope such delays do not occur=2E
>>=20
>> For the case of the hypervisor=E2=86=90=E2=86=92guest interface this sh=
ould be handled
>> by the use of memory barriers and the seqcount lock=2E
>>=20
>> The guest driver reads the seqcount, performs a read memory barrier,
>> then reads the contents of the structure=2E Then performs *another* rea=
d
>> memory barrier, and checks the seqcount hasn't changed:
>> https://git=2Einfradead=2Eorg/?p=3Dusers/dwmw2/linux=2Egit;a=3Dblob;f=
=3Ddrivers/ptp/ptp_vmclock=2Ec;hb=3Dvmclock#l351
>>=20
>> The converse happens with write barriers on the hypervisor side:
>> https://git=2Einfradead=2Eorg/?p=3Dusers/dwmw2/qemu=2Egit;a=3Dblob;f=3D=
hw/acpi/vmclock=2Ec;hb=3Dvmclock#l68
>
>My point is that, looking at the above steps 1=2E - 5=2E:
>
>3=2E read HW counter, smp_rmb, read seqcount
>4=2E store seqcount, smp_wmb, stores, smp_wmb, store seqcount become effe=
ctive
>5=2E read seqcount, smp_rmb, read HW counter
>
>AFAIU this would still be a theoretical problem suggesting the use of
>stronger barriers=2E

This seems like a bug on the guest side=2E The HW counter needs to be read=
 *within* the (paired, matching) seqcount reads, not before or after=2E



