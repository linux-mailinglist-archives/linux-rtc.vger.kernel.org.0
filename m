Return-Path: <linux-rtc+bounces-6332-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOe/AgYE3mkQmQkAu9opvQ
	(envelope-from <linux-rtc+bounces-6332-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 11:08:22 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 559853F7A9E
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 11:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0FA2C301EC77
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2026 09:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAB537F756;
	Tue, 14 Apr 2026 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20251104.gappssmtp.com header.i=@spacecubics-com.20251104.gappssmtp.com header.b="tazj7GX9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019A13635C
	for <linux-rtc@vger.kernel.org>; Tue, 14 Apr 2026 09:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776157699; cv=pass; b=KBDfq0TDmkdV0qM71GQVqcH6BzmMm7ZXCOa/KIdFuZTQfycnamhrCjP9qtv4P1VTtfwJ6ZU6tHzfl03xJPj/ntBRj5fK5j2Q+Pd4SMPp+7iKE1BDc5pX1amwlQiJ9rci2Pldm9SscUOOtqCaTxrYi5W9VibStTPVgIqSJnk0Vyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776157699; c=relaxed/simple;
	bh=xRVyRPSzicQNHQsEyxhcUfbzv/3RlD9SoOp+ervDBOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeXoHsdfB24BFGboX/lqlVQLVae5u29AU3fj0rTe0oLVKMoITzxgw/O4yR6qYsOfFHGxcVcY/uPEqkCidlQXE5kjp3U/Fay6cqx6Q5E9zHH3oO95eujqz0tPAPQvhKLKBXEbGsjOP1t3wlW2sB4K55BvpcZPDS1NM1GMlw/ytK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com; spf=none smtp.mailfrom=spacecubics.com; dkim=pass (2048-bit key) header.d=spacecubics-com.20251104.gappssmtp.com header.i=@spacecubics-com.20251104.gappssmtp.com header.b=tazj7GX9; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=spacecubics.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so996173666b.2
        for <linux-rtc@vger.kernel.org>; Tue, 14 Apr 2026 02:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776157695; cv=none;
        d=google.com; s=arc-20240605;
        b=A4HrPyDjRDhQhyN1PVUSY91jp6kTWXuKzoktL9CWx/PE7CBw0+pKAsrOwxXbwKupxr
         /96A3niS2DxJYeeIqvJKohZfc3PNu04F3HjHPjVUu4OXlQBf+wiE6PQ2Xw6SDsPnwy8H
         mA45JgZOk7WqeLfT5vLPl3fxQp7yiPxG5oRnya/n5h92+SSEWCTGdItRzDoEpnEND3Nu
         958r2M5AsvEtl73ySnw2wGYyTG5PS47E9rwPpcw0XXozvpZjo8yZkvqXcZGtJqFT9QLE
         hCJCNnwsZmHpbza5fDcwbo9KM3NJEdFxZpFhbCVHt1xbyRDUOA2qJZobK9Z/ZI1L3cuG
         mR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xRVyRPSzicQNHQsEyxhcUfbzv/3RlD9SoOp+ervDBOo=;
        fh=Wb02+jTyn4Nw6oz1rAtpB8OVClWtkl8HLMui9Ycaguw=;
        b=UqLqpe43Y6Nw8gMkwabZXR1BMd1h6O+inpvwlKhJKQLSnwuX5RKPMaAH2Oyt4d+ENS
         xxBoGjj8b/CIc7p47zRA/4i5YoQQVk/1VOF/LzuzRFlD92isZN2Scn++HzRjelnx6Hbh
         18IbBnQCa9hjvEjHW3JPYmjotrK2I3sINw8wH39EM7705C0DAIukDjV2vBLRr1eA58Fe
         RNNiTixpldfh1yxrH089OZsIvtlajmiF6x1qR6wgJhDHS4dZTRA6O4pAew3Os3c6XaFr
         C4R+BsTx5Jic6nf3d0y0RhnyzdG+f/+FUdZX5MZOTH9CbB9lvnHEiiOwVqjCC/84e6/G
         Lh7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20251104.gappssmtp.com; s=20251104; t=1776157695; x=1776762495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRVyRPSzicQNHQsEyxhcUfbzv/3RlD9SoOp+ervDBOo=;
        b=tazj7GX9Sv3hJyatplpKLZB2HN6ecP2OXBQaLqPXcauhxd6a0MaSQ7HLWg1rOTPKYM
         HgIARmwMheD/SYjx87KYcCkbfooOACR1l3rb5dfE8KzgNDSP8a33Zs3ec9LvXs8T5pYt
         oYRFnWienBv4yNeoNr+HwjCYSJOx9aUiqX0Tz6fZew+ipciwOF5RfB4pcDmWBatYC3bi
         8s8z8VPtvDveUv3E9zeqW9OwfVkw1rzwqeDtjsT0JnhC+esJvXrF+RoJ10vzX2CHcE5a
         bIHB6lY9PuGAX6p00bO5SIGe2lUVEbuxlXx6XT2X+iQZHJIasAhmRlesIai+MEbHtqQz
         5jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157695; x=1776762495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xRVyRPSzicQNHQsEyxhcUfbzv/3RlD9SoOp+ervDBOo=;
        b=EfM9plE697FZfTmf4NBBy6+qdII9OHaL1V62ZATtKvIgSX78dE+vuURd8rndFVnihX
         bk2Bb2xDgwiCVoYMAqzKHb4dYxOiHTmDQA4rFIHOSRHJRCI5b2lgldWwCpK2mGd+222J
         Y72NihJ+EOtFp7fbGWsGHYKunba7PXR/lYYNFDAnjSd1zxRj+oEXKEpTeGloTfj8IdlW
         8piy7GR0Ln2HobP9TyQ8oi5JlHvE4O19pyE7yYIn1sv1gBugHniZGpS8VY0aP7EjM8Qv
         6MdyCt5ewxS+4eEbH056ftqlZcDvGbehUtMtUNZ1c25fyNhk/2kUVSV1I9he8OyHbIM2
         zXKA==
X-Forwarded-Encrypted: i=1; AFNElJ9C4y3cZqESC7N7R5qt+o+gZKXzmcmqZOm7tys+hWaWludiGTOGtbHtsZ/0Wefb9YMZOExnthnuklE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywts/KeZgzxZonTU0XDDzHtiuF9hZYKx7sP3fbukD92DIgNVwy3
	caknFP6U4PacyyVhX1+WiwU0nSPpguBXQ9pJOfow9568+2ni+XwsF93r4RWXcf2o9jjZ+2VuSFc
	RcbNgiEL+Q3IzkHy7gk1ZMcs1xusW1C12WCkrrWdkrw==
X-Gm-Gg: AeBDieuhPQr5p72Q96k4Md2BwvD8sRUkaErHCvCBVOyULf4rq/M9Y/xK1riUyOBeJ4q
	ZU4WbqZm9Gsy01yvypLUtnXjazvJnp3ikGsqkjgTqqqCJoUSzztrulSQBRHhvIBxv7axLagE0K5
	HO+ya+Zb3nJkyqR6CXKA085OKwByJrAqpPxeg1hQS8TDNoA01s+8MaFZuXD0qfz6idm10Isztk+
	AFLA22faK9gSSFuAHwNYiqXXG2lRw0VjboS4y/biWDt/zMNU/4avciIsYLL1Sw7kGwrRCHj33kT
	eyTCP/3n
X-Received: by 2002:a17:907:6c0f:b0:b9c:625d:1879 with SMTP id
 a640c23a62f3a-b9d729c00c2mr879107566b.38.1776157694332; Tue, 14 Apr 2026
 02:08:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com> <202603061113298cbba29d@mail.local>
 <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
 <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com> <CAJACUapT3cNwQtyE1zmQcGfDex2jmrbvvd9vOvZhC3v8+h3cZQ@mail.gmail.com>
 <6ea7ad01-3bf1-45b0-a06b-85e2b9c0f83b@amd.com>
In-Reply-To: <6ea7ad01-3bf1-45b0-a06b-85e2b9c0f83b@amd.com>
From: Takumi Ando <takumi@spacecubics.com>
Date: Tue, 14 Apr 2026 18:08:03 +0900
X-Gm-Features: AQROBzB61jhnvPzgA--mCyhKKiTgpQjUTkKKF1YjmunR2pCtP50zdJqvkVOFzno
Message-ID: <CAJACUaqc6B_cWp0is5gQ9Sw=Jmf-bjxCqdg5PJu9F=oWWMa9+w@mail.gmail.com>
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: "T, Harini" <harini.t@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomas Melin <tomas.melin@vaisala.com>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	Yasushi SHOJI <yashi@spacecubics.com>, kanta tamura <kanta@spacecubics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[spacecubics-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[spacecubics.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6332-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[spacecubics-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takumi@spacecubics.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:url,aka.ms:url,mail.gmail.com:mid,bootlin.com:email,bootlin.com:url,spacecubics-com.20251104.gappssmtp.com:dkim,spacecubics.com:email]
X-Rspamd-Queue-Id: 559853F7A9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Harini,

Thank you for your reply.

So, if I understand correctly, calibration should be performed periodically
from userspace via /sys/class/rtc/rtcX/offset.

In that case, would it be correct to say that, in the current driver,
programming
the CALIB_WRITE register from the DTB during probe is not only ineffective,
but may actually be inappropriate, since the initial value is
undefined and there
is no reliable way to determine whether it has already been initialized?

Best regards,

2026=E5=B9=B44=E6=9C=889=E6=97=A5(=E6=9C=A8) 20:11 T, Harini <harini.t@amd.=
com>:

>
> Hi,
>
> On 3/11/2026 12:22 PM, Takumi Ando wrote:
> > [You don't often get email from takumi@spacecubics.com. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This message originated from an External Source. Use proper ca=
ution when opening attachments, clicking links, or responding.
> >
> >
> > Hi Tomas,
> >
> > Thanks for the clarification.
> >
> > My understanding is that the fractional correction (fract_data) should
> > indeed be managed from userspace since it represents oscillator drift
> > and may change over time.
> >
> > However, the Max_Tick field seems to have a different role: it defines
> > the number of RTC oscillator cycles corresponding to one second.
> > For example, with a 32.768 kHz oscillator the value should be 32768-1.
> >
> > This is how I interpreted the documentation as well.
> > In the AM012, the description of Max_Tick says that the
> > register value multiplied by the oscillator period should equal one
> > second, and it explicitly states that for a 32.768 kHz oscillator the
> > value will be 0x7FFF.
> >
> > Because of this, it appears that Max_Tick depends only on the oscillato=
r
> > frequency and should not change dynamically like the fractional
> > correction.
> >
> > Did I misunderstand the purpose of the Max_Tick field?
>
> Your understanding of the Max_Tick field is correct. However, in the
> driver's set_offset() implementation, the ppb offset is decomposed into
> a whole-tick adjustment (which modifies the Max_Tick) and a
> fractional-tick adjustment (fract_data).
> Both fields are written together to the calibration register in a single
> operation. This is what Tomas was referring to when he said both may chan=
ge.
>
> Since the crystal is never exactly 32.678 kHz and its frequency varies
> with temperature and aging, userspace must always compute and apply
> correct offset. When it does so via /sys/class/rtc/rtcX/offset, the
> entire calibration register including Max_Tick is programmed to the
> appropriate value.
>
> Additionally writing Max_Tick unconditionally during probe would destroy
> a valid calibration value that may have been preserved across a warm
> reboot on a battery-backed RTC.
>
> Thanks,
> Harini T
>
> >
> > Best regards,
> >
> > 2026=E5=B9=B43=E6=9C=8811=E6=97=A5(=E6=B0=B4) 14:23 Tomas Melin <tomas.=
melin@vaisala.com>:
> >>
> >> Hi,
> >>
> >> On 11/03/2026 05:19, Takumi Ando wrote:
> >>> [You don't often get email from takumi@spacecubics.com. Learn why thi=
s is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>>
> >>> Hi Tomas, Alexandre,
> >>>
> >>> Thank you for the explanations.
> >>>
> >>> So if I understand correctly, both on Zynq UltraScale+ and Versal,
> >>> CALIB_RD may return a non-zero (or otherwise undefined) value after
> >>> reset, meaning that it cannot reliably be used to determine whether
> >>> the calibration register has already been initialized.
> >>>
> >>> While the fractional calibration should indeed be handled from
> >>> userspace (e.g. via the RTC offset interface), it seems that the
> >>> Max_Tick field should still always be programmed according to the
> >>> value provided in Device Tree, since it depends only on the RTC
> >>> oscillator frequency.
> >>
> >> Both max_tick and fract_data might change, it depends on how big
> >>
> >> the calibrator drift/offset is and if it is negative/positive.
> >>
> >>>
> >>> Would it make sense for the driver to always program Max_Tick from th=
e
> >>> Device Tree "calibration" property while preserving the fractional
> >>> calibration bits currently stored in hardware?
> >>
> >> As Alexandre mentioned, user space needs to ensure calibration is what
> >> it should be.
> >>
> >>
> >> thanks,
> >>
> >> Tomas
> >>
> >>
> >>>
> >>> If this approach sounds reasonable, I would like to prepare a patch
> >>> for upstream.
> >>>
> >>> Best regards,
> >>>
> >>> 2026=E5=B9=B43=E6=9C=886=E6=97=A5(=E9=87=91) 20:13 Alexandre Belloni =
<alexandre.belloni@bootlin.com>:
> >>>> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
> >>>>>> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> >>>>>> CALIB_RD resets to 0, so the current logic works correctly there.
> >>>>>> However, this assumption does not appear to hold for Versal.
> >>>>> For Ultrascale+ the calibration register also gives random values a=
fter
> >>>>> reset, perhaps you have noticed this:
> >>>>> https://adaptivesupport.amd.com/s/article/000036886?language=3Den_U=
S. Maybe
> >>>>> the same can occur also on Versal.
> >>>>>
> >>>>> AFAIK there is no way of knowing if the value is correct or not aft=
er reset,
> >>>>> so user space helpers might be needed to maintain the calibration v=
alue at a
> >>>>> desired value.
> >>>>>
> >>>> Userspace is always needed to put the proper calibration, there is n=
o
> >>>> way for the kernel to know what value to put there. In the support c=
ase
> >>>> above, the crystal will never be exactly 32768Hz and this value will
> >>>> change over time and also depends on the temperature. The value alwa=
ys
> >>>> needs to be computed, if your device can do NTP, chrony will provide=
 the
> >>>> proper offsets. If you don't have a way to measure the deviation, th=
en
> >>>> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
> >>>> doesn't hold the correct value.
> >>>> There is no need for devmem here.
> >>>>
> >>>> --
> >>>> Alexandre Belloni, co-owner and COO, Bootlin
> >>>> Embedded Linux and Kernel engineering
> >>>> https://bootlin.com/
> >>>
> >>>
> >>> --
> >>> Takumi Ando
> >>> Space Cubics Inc.
> >
> >
> >
> > --
> > Takumi Ando
> > Space Cubics Inc.
> >
>


--
Takumi Ando
Space Cubics Inc.

