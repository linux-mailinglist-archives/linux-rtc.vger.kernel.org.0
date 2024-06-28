Return-Path: <linux-rtc+bounces-1427-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFCD91C81F
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 23:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 936E71F22AE3
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Jun 2024 21:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91AF57F490;
	Fri, 28 Jun 2024 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VHEVTrqq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C042B7EEF5;
	Fri, 28 Jun 2024 21:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719610093; cv=none; b=co5EeNHnBntaKr26PZXlnmj7Lky5FvwPITa0cdIB+mT5pXfYcou9c/CGlWA1n7IsbiMXrs0IQuyR1klAbsLxlNmSqHdP0bgSiU9BdoX2Uix/NaNvbZGk4pv/e4mDEII2XeF4atLAm567DlmBLCJ0WPFA6mvdr1Uy/AWSGVszyGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719610093; c=relaxed/simple;
	bh=xsDY8QdZRgTboHMIuie0O6lnfkxpq/5pzOpIBWqAYhs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uYtYn5VYbuRwPAR45p98RfoEFDTothJ9e8iYF79KOsSM2Y36NRdzszLS3+/zp96HrhaSxOmmF83OeHbKZPAFe4zftq87RYonSaIa6ot0u9ErqbUR1Jt4S9WChdkdTgCjNxKU8a2Liut7c9TLqmZoaWCtEEQgQt2ESijSYo1/dVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VHEVTrqq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xsDY8QdZRgTboHMIuie0O6lnfkxpq/5pzOpIBWqAYhs=; b=VHEVTrqqjkjcWuJ0PQtKaf3MzN
	p+nYcY0Zt0P70x7BH6jO7K9M0M2SFruboWUAOxYnZoAKPjdYqPBjchCiIV2HTpqX0uIQfaJN2LQna
	qiY9T9gSIfzyOLaYFN9tdaj29hYee4WINNqm9oXtzqm3USzhNSKLF3+H60a2OiBVpPX7IVXlfxSHZ
	5a7SIEx0zaBwxAQU17pFofWBcFm2T7FsYGYStcs6pByPG3UX9Q00W0QlidIMXKeUyEl+vzieXxCMF
	oWFujAx9ccp5fbQkPlYCPikIhgjpoj3b6xpJEklmFC4fo9lDsQZn8cr0aZtjbnYyikfwf2xBMQ92N
	SyAX8ZWA==;
Received: from [109.144.30.113] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNJ8H-000000095jF-0oaD;
	Fri, 28 Jun 2024 21:27:57 +0000
Date: Fri, 28 Jun 2024 22:27:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, "Ridoux, Julien" <ridouxj@amazon.com>,
 virtio-dev@lists.linux.dev, "Luu, Ryan" <rluu@amazon.com>
CC: "Christopher S. Hall" <christopher.s.hall@intel.com>,
 Jason Wang <jasowang@redhat.com>, John Stultz <jstultz@google.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [RFC PATCH v2] ptp: Add vDSO-style vmclock support
User-Agent: K-9 Mail for Android
In-Reply-To: <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com> <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org> <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com> <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org> <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org> <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org> <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com> <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org> <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com> <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org> <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com>
Message-ID: <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org>
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

On 28 June 2024 17:38:15 BST, Peter Hilber <peter=2Ehilber@opensynergy=2Eco=
m> wrote:
>On 28=2E06=2E24 14:15, David Woodhouse wrote:
>> On Fri, 2024-06-28 at 13:33 +0200, Peter Hilber wrote:
>>> On 27=2E06=2E24 16:52, David Woodhouse wrote:
>>>> I already added a flags field, so this might look something like:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Smearing flags=2E =
The UTC clock exposed through this structure
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is only ever true =
UTC, but a guest operating system may
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * choose to offer a =
monotonic smeared clock to its users=2E This
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * merely offers a hi=
nt about what kind of smearing to perform,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * for consistency wi=
th systems in the nearby environment=2E
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>> #define VMCLOCK_FLAGS_SMEAR_UTC_SLS (1<<5) /* draft-kuhn-leapsecond-0=
0=2Etxt */
>>>>
>>>> (UTC-SLS is probably a bad example but are there formal definitions f=
or
>>>> anything else?)
>>>
>>> I think it could also be more generic, like flags for linear smearing,
>>> cosine smearing(?), and smear_start_sec and smear_end_sec fields (rela=
tive
>>> to the leap second start)=2E That could also represent UTC-SLS, and
>>> noon-to-noon, and it would be well-defined=2E
>>>
>>> This should reduce the likelihood that the guest doesn't know the smea=
ring
>>> variant=2E
>>=20
>> I'm wary of making it too generic=2E That would seem to encourage a
>> *proliferation* of false "UTC-like" clocks=2E
>>=20
>> It's bad enough that we do smearing at all, let alone that we don't
>> have a single definition of how to do it=2E
>>=20
>> I made the smearing hint a full uint8_t instead of using bits in flags,
>> in the end=2E That gives us a full 255 ways of lying to users about wha=
t
>> the time is, so we're unlikely to run out=2E And it's easy enough to ad=
d
>> a new VMCLOCK_SMEARING_XXX type to the 'registry' for any new methods
>> that get invented=2E
>>=20
>>=20
>
>My concern is that the registry update may come after a driver has alread=
y
>been implemented, so that it may be hard to ensure that the smearing whic=
h
>has been chosen is actually implemented=2E

Well yes, but why in the name of all that is holy would anyone want to inv=
ent *new* ways to lie to users about the time? If we capture the existing o=
nes as we write this, surely it's a good thing that there's a barrier to en=
try for adding more?


>But the error bounds could be large or missing=2E I am trying to address =
use
>cases where the host steps or slews the clock as well=2E

The host is absolutely intended to be skewing the clock to keep it accurat=
e as the frequency of the underlying oscillator changes, and the seq_count =
field will change every time the host does so=2E

Do we need to handle steps differently? Or just let the guest deal with it=
?

If an NTP server suddenly steps the time it reports, what does the client =
do?


