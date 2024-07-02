Return-Path: <linux-rtc+bounces-1440-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322B1924761
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 20:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCC561F21ACB
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Jul 2024 18:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8DD1C9EAA;
	Tue,  2 Jul 2024 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W8u3i889"
X-Original-To: linux-rtc@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275461DFE3;
	Tue,  2 Jul 2024 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719945622; cv=none; b=YD7+m27XCmcpJW9tpbLdOsPFYUPb5iGR2pTdiduBvZLdQZAKBzS5YSD+YW/Or3546tZdqZE4qed6TFsXed+KKKUj/AYK3/Cm6lmppAWlHQ8XoweOW4ihc0TzCHLzMH6ox70Mx03qpyfcFmtlAfH87bzIebtxPfjh9mAlFPlaFuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719945622; c=relaxed/simple;
	bh=XlhLqAUMcg+sJf064MDVicDasZ/lcOHYbpSPJSTSDvI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=G9X0vP6+SfjLScSMv20+d0ZNZH7p72a/pipKdLYaPYQhj/axp/yJbUiKmgxrDUpnI1PnszMCtgZPEIzkRqkYoGnN5EZQll28/oyOtw0zzycWGey8f7TGY37NFPdIZNj6e6eWWDm/8+saAMWp1+kAWwuUPspDi2Xk6q0RGWJ7xRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W8u3i889; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RJSqylBZlzW9UDCHCqo3Xfdt29Ffczco70FXx734zXo=; b=W8u3i889blo/jC1uilhFu/Yv9K
	DQ9k2/5RYKE9bFhzWgXt+qmRVEYimUpcIzTQorHpZTs0sI+Wuw9P7Y9PKvMWZy7Hyt+1ku1VT3L4j
	zigvimNVllEcFg+TAavc51UyH6hvMn5lWe7yyv/WCORZItTjkvmM+ible75PooH827bgjsC3/HBzY
	DxFtxU+Nl4iICPDA/17ID9pxbpRhuTxgAZjT7ZiSwSySjsRuQMugzG6eSy/oUKFrjqf3pXeBiJsGR
	ywLBRO+CmelMGec+Q/a6G+Lp5eow6Xtl6Ei4AfGmU79ts4I4BYyE0s0VInEBotHZ770lYW+Q+HD8l
	EGHkoTbQ==;
Received: from [2a00:23ee:2318:7901:3188:7b97:6ee:f783] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOiQ9-00000009rA4-2tiF;
	Tue, 02 Jul 2024 18:40:06 +0000
Date: Tue, 02 Jul 2024 19:40:04 +0100
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
In-Reply-To: <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com> <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org> <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com> <db594efd5a5774748a9ef07cc86741f5a677bdbf.camel@infradead.org> <c0ae63fc88365c93d5401972683a41112c094704.camel@infradead.org> <4a0a240dffc21dde4d69179288547b945142259f.camel@infradead.org> <8d9d7ce2-4dd1-4f54-a468-79ef5970a708@opensynergy.com> <bdcafc76ea44db244b52f8a092287cb33950d5d6.camel@infradead.org> <db1113d5-a427-4eb7-b5d1-8174a71e63b6@opensynergy.com> <c69d7d380575e49bd9cb995e060d205fb41aef8f.camel@infradead.org> <2de9275f-b344-4a76-897b-52d5f4bdca59@opensynergy.com> <BC212953-A043-4D65-ABF3-326DBF7F10F7@infradead.org> <51087cd7149ce576aa166d32d051592b146ce2c4.camel@infradead.org> <cb11ff57-4d58-4d47-824b-761712e12bdc@opensynergy.com> <3707d99d0dfea45d05fd65f669132c2e546f35c6.camel@infradead.org> <19c75212-bcb6-49e3-964d-ed727da2ba54@opensynergy.com>
Message-ID: <02E9F187-A38C-4D14-A287-AFD7503B6B0F@infradead.org>
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

On 2 July 2024 19:12:00 BST, Peter Hilber <peter=2Ehilber@opensynergy=2Ecom=
> wrote:
>On 02=2E07=2E24 18:39, David Woodhouse wrote:
>> To clarify then, the main types are
>>=20
>>  VIRTIO_RTC_CLOCK_UTC =3D=3D 0
>>  VIRTIO_RTC_CLOCK_TAI =3D=3D 1
>>  VIRTIO_RTC_CLOCK_MONOTONIC =3D=3D 2
>>  VIRTIO_RTC_CLOCK_SMEARED_UTC =3D=3D 3
>>=20
>> And the subtypes are *only* for the case of
>> VIRTIO_RTC_CLOCK_SMEARED_UTC=2E They include
>>=20
>>  VIRTIO_RTC_SUBTYPE_STRICT
>>  VIRTIO_RTC_SUBTYPE_UNDEFINED /* or whatever you want to call it */
>>  VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR=20
>>  VIRTIO_RTC_SUBTYPE_UTC_SLS /* if it's worth doing this one */
>>=20
>> Is that what we just agreed on?
>>=20
>>=20
>
>This is a misunderstanding=2E My idea was that the main types are
>
>>  VIRTIO_RTC_CLOCK_UTC =3D=3D 0
>>  VIRTIO_RTC_CLOCK_TAI =3D=3D 1
>>  VIRTIO_RTC_CLOCK_MONOTONIC =3D=3D 2
>>  VIRTIO_RTC_CLOCK_SMEARED_UTC =3D=3D 3
>
>VIRTIO_RTC_CLOCK_MAYBE_SMEARED_UTC =3D=3D 4
>
>The subtypes would be (1st for clocks other than
>VIRTIO_RTC_CLOCK_SMEARED_UTC, 2nd to last for
>VIRTIO_RTC_CLOCK_SMEARED_UTC):
>
>#define VIRTIO_RTC_SUBTYPE_STRICT 0
>#define VIRTIO_RTC_SUBTYPE_SMEAR_NOON_LINEAR 1
>#define VIRTIO_RTC_SUBTYPE_SMEAR_UTC_SLS 2
>

Thanks=2E I really do think that from the guest point of view there's real=
ly no distinction between "maybe smeared" and "undefined smearing", and hav=
e a preference for using the latter form, which is the key difference there=
?

Again though, not a hill for me to die on=2E

