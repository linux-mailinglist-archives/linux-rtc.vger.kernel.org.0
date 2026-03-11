Return-Path: <linux-rtc+bounces-6167-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOpoJrIRsWmYqQIAu9opvQ
	(envelope-from <linux-rtc+bounces-6167-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 07:54:42 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB625D194
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 07:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0401305D6D5
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 06:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D477F372EC6;
	Wed, 11 Mar 2026 06:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b="Gh9h8fy+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42324677F
	for <linux-rtc@vger.kernel.org>; Wed, 11 Mar 2026 06:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211974; cv=pass; b=ceaJyzrdoxmE5wHwCQM9KmFBP5oltsIxN0/7XCudxnKC4Gqv3Ml42SxuKWsmRYHPQjSQPbd4GJP6am9apdO64xaTpnlP3vcFKWNfwZYrped/l7Zmq9HaejJOGbxNQh6/RZd5tJ6PzreacDaJQQIN/DnjaGBv8PZR+jOZSyqn0xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211974; c=relaxed/simple;
	bh=a8lgQlz3o8mxiQRHZnuOls/Pw+YBOhYyeXr99nATTzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENo7poF3WjdbesYsZ2fuCJkIJiXuHlC19SLT1ckQitXIaurlf2XfWc4e9hLHgaq6VvurPRSvNqBOrnSmDchDRzucvpEpUF4RhwuqoJO+E4nMoYBgPXAJNec43lwsUlTlS2v7DTqjCMdOMvPBxvy7Ek7DC2CPjcSWXfD/5T5NCbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com; spf=none smtp.mailfrom=spacecubics.com; dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b=Gh9h8fy+; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=spacecubics.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66281b1018bso4925440a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Mar 2026 23:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773211971; cv=none;
        d=google.com; s=arc-20240605;
        b=LYSpDNXDi238MlLb+ZCzGQdx/Rz9x57RAReqRdKJ5kyLlqFv+yv9DntvCYPQX0QdWp
         anhbJXQUyVRBGWsTFiShHErjMXahuETrQISLcUfAoQ4O0W0mkY1Prw3oe/o6kf9UEzzj
         OJSQRmaF2KsezmdBWQKFdWg6Rlo6mGE5AKe4/UJii5k5/gTSomsKSKtqRLPesg/CWcxP
         rFXaKXvUVRoMqdCsSWxI+QxIGsMBHdxzkRdwvnt1TXOvwgTL43AeGVIv3bPlIOhb+2Pc
         UKhtK3hizm5CqI9DhVTITkWwPuOsh9CfVdeMg5puaWJNGzNE2jpGimPUusFxyxvKh6ee
         Tr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a8lgQlz3o8mxiQRHZnuOls/Pw+YBOhYyeXr99nATTzs=;
        fh=zW8E4Ogh7P08nSdr3Xb3gZMTUikMf+X41hQ1RbLVmgU=;
        b=AxrZCxhmPZAoECQ8yJ7RgeebnraJBII640C0Tzt6Cs7DA0pRwL7z6ppbABF6wkRuN2
         X1a53R6g3x4O8vKt1XqZcL3xypObmjZ2DNVTwC2qJJjWmV8OJNPnHDDpVjFp5MhZZFxd
         fOsefnB/sbYlBtXkH7lWDbz7ZBA9p5Vtyvy9aLuYOsDDKzltTPqcYfPVpyhGPOtoYdU/
         VegY0hBcZOi0BCnVEjy1OYlY4Iz9qJLhyYd/f5ofYXxuvrK8Zh1eKx9zD6uswZ5oOCjb
         eDmterxdQwR1ADVrp5KKlw8F2eQoZmIZKdXQlkplLM9XBVXgInlM650tKtVENFeSQy6e
         DG3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20230601.gappssmtp.com; s=20230601; t=1773211971; x=1773816771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8lgQlz3o8mxiQRHZnuOls/Pw+YBOhYyeXr99nATTzs=;
        b=Gh9h8fy+9AYmG4/11dAOCOuW4tqDKbLLIudb8rCauBqSnwgaZRdO4Eq2JKaTovSxtj
         LHbDIvNpTXa14hVWB21S/h/1yQmqTR5vu9W0IMcn4jzJ2h5EDuZNhN14K326d1ZRsT1g
         KO1GlolZSpIynMIprYgc5hx7ZtRUxzhitIKqmsVYEQOyyg0/JEpYJQ0waEp6Zw5lqg/m
         gyvkHq+hMV6fSDK7AZPN57GVsGBlNottfjTNI5oTJ2+0nuJImHJrM0cBBai7BJYYQO1p
         plImmP4ttirKQP4gUhvsvLkOC2zlWZkbOxW9ulSlp/3riLQ6hU3YRD9NAUSTqHo4xHAC
         gggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211971; x=1773816771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8lgQlz3o8mxiQRHZnuOls/Pw+YBOhYyeXr99nATTzs=;
        b=nD9P7UJNjGyIdcrrjQyvzF48q81ykHKVAEQBxMuyDl7mTNxm54wpugl6o+9fVdqFKC
         +YOAKSDM8SNDJ1EIbBhGIEeqIo0xFhjdZH+u724jpfIFHVFyiiKXcJhnT90RI/WbNMAy
         QjTV9Ng1i/vSswMPtftx3vhDUl5MEUeqSpm7n5kkibqT6npiDZyzNfiNFaum4tdc+kcJ
         jM2oe3P9Oby1wzNuRFMI8Eqsq08yYlk9rsH37rujiqp2jFSPpKxi+UezAWN6FkD4hMNU
         atn9NGWvJ7n9fksgg8+OVxuWzEOtkAdbCypSnksy4pwPgLah6hqhv7ilVMUJbdv++Fe7
         wBpg==
X-Forwarded-Encrypted: i=1; AJvYcCUppLKP98gOgZJCFDEaQ+C0ob+qwmOD6afFGTYdLASfzTFlBSuUsbQV5wA/EuRbv9V7LT8UHVUGr0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56KlgM6f1Ox1j8tXlAKYI4IGf96DOfzBFYeRqwUEZGFsMeTq1
	rI67+624BrXEOvBULU63MzaJSHjlsWOFDHzl1KEUjyaxGs24ofNVhXfh79hq0sei65upr7PuZYK
	U8BesLfAGBZeEfl/oIE/y+MplOMiOMFMmEx1u2L0Ugb0y6xUATKj6vGjqLw==
X-Gm-Gg: ATEYQzwjwJBg542VGhjBsVPFRaLwuVSOsyaXDaQumroGQiWrr4YQtHNBQFWXVPlmlAN
	zo8QCGa9UnN6M2RCIPYVhqnxbKl2Q0cbBN7WoxgzQEK5Gx/qifsuQWP1D493fFwzu7YRDvacF6C
	xehh537d9meJB9UQJ+ocYs0HA5lFImfZBscovR08aoBEG/bfOcYSxo2njB06zYnc90aPIugQO3i
	FreFfGBoG76mdehRxUeiZHnRmxjRspicSo2JkWNKFLa0MV9fg82mEvrNZ+lEEFMBtHWgHNq6hxB
	dJ4rLbF3GtKIFWPtnHw=
X-Received: by 2002:a05:6402:f0a:b0:662:ce20:f22c with SMTP id
 4fb4d7f45d1cf-66319edf97amr460422a12.28.1773211970975; Tue, 10 Mar 2026
 23:52:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com> <202603061113298cbba29d@mail.local>
 <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com> <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com>
In-Reply-To: <ac27be8f-363e-42e6-8b46-e95ab739762a@vaisala.com>
From: Takumi Ando <takumi@spacecubics.com>
Date: Wed, 11 Mar 2026 15:52:39 +0900
X-Gm-Features: AaiRm50iDsz9pUNYLXhpwMJrxA7ZxNSK2mhlnVh0ScEj875xbijxl3nEEuL0wok
Message-ID: <CAJACUapT3cNwQtyE1zmQcGfDex2jmrbvvd9vOvZhC3v8+h3cZQ@mail.gmail.com>
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	michal.simek@amd.com, Yasushi SHOJI <yashi@spacecubics.com>, 
	kanta tamura <kanta@spacecubics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D7EB625D194
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[spacecubics-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[spacecubics.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6167-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[spacecubics-com.20230601.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takumi@spacecubics.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	REDIRECTOR_URL(0.00)[aka.ms];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,amd.com:url,aka.ms:url,bootlin.com:url,bootlin.com:email,spacecubics.com:email]
X-Rspamd-Action: no action

Hi Tomas,

Thanks for the clarification.

My understanding is that the fractional correction (fract_data) should
indeed be managed from userspace since it represents oscillator drift
and may change over time.

However, the Max_Tick field seems to have a different role: it defines
the number of RTC oscillator cycles corresponding to one second.
For example, with a 32.768 kHz oscillator the value should be 32768-1.

This is how I interpreted the documentation as well.
In the AM012, the description of Max_Tick says that the
register value multiplied by the oscillator period should equal one
second, and it explicitly states that for a 32.768 kHz oscillator the
value will be 0x7FFF.

Because of this, it appears that Max_Tick depends only on the oscillator
frequency and should not change dynamically like the fractional
correction.

Did I misunderstand the purpose of the Max_Tick field?

Best regards,

2026=E5=B9=B43=E6=9C=8811=E6=97=A5(=E6=B0=B4) 14:23 Tomas Melin <tomas.meli=
n@vaisala.com>:
>
> Hi,
>
> On 11/03/2026 05:19, Takumi Ando wrote:
> > [You don't often get email from takumi@spacecubics.com. Learn why this =
is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hi Tomas, Alexandre,
> >
> > Thank you for the explanations.
> >
> > So if I understand correctly, both on Zynq UltraScale+ and Versal,
> > CALIB_RD may return a non-zero (or otherwise undefined) value after
> > reset, meaning that it cannot reliably be used to determine whether
> > the calibration register has already been initialized.
> >
> > While the fractional calibration should indeed be handled from
> > userspace (e.g. via the RTC offset interface), it seems that the
> > Max_Tick field should still always be programmed according to the
> > value provided in Device Tree, since it depends only on the RTC
> > oscillator frequency.
>
> Both max_tick and fract_data might change, it depends on how big
>
> the calibrator drift/offset is and if it is negative/positive.
>
> >
> > Would it make sense for the driver to always program Max_Tick from the
> > Device Tree "calibration" property while preserving the fractional
> > calibration bits currently stored in hardware?
>
> As Alexandre mentioned, user space needs to ensure calibration is what
> it should be.
>
>
> thanks,
>
> Tomas
>
>
> >
> > If this approach sounds reasonable, I would like to prepare a patch
> > for upstream.
> >
> > Best regards,
> >
> > 2026=E5=B9=B43=E6=9C=886=E6=97=A5(=E9=87=91) 20:13 Alexandre Belloni <a=
lexandre.belloni@bootlin.com>:
> >> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
> >>>> On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> >>>> CALIB_RD resets to 0, so the current logic works correctly there.
> >>>> However, this assumption does not appear to hold for Versal.
> >>> For Ultrascale+ the calibration register also gives random values aft=
er
> >>> reset, perhaps you have noticed this:
> >>> https://adaptivesupport.amd.com/s/article/000036886?language=3Den_US.=
 Maybe
> >>> the same can occur also on Versal.
> >>>
> >>> AFAIK there is no way of knowing if the value is correct or not after=
 reset,
> >>> so user space helpers might be needed to maintain the calibration val=
ue at a
> >>> desired value.
> >>>
> >> Userspace is always needed to put the proper calibration, there is no
> >> way for the kernel to know what value to put there. In the support cas=
e
> >> above, the crystal will never be exactly 32768Hz and this value will
> >> change over time and also depends on the temperature. The value always
> >> needs to be computed, if your device can do NTP, chrony will provide t=
he
> >> proper offsets. If you don't have a way to measure the deviation, then
> >> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
> >> doesn't hold the correct value.
> >> There is no need for devmem here.
> >>
> >> --
> >> Alexandre Belloni, co-owner and COO, Bootlin
> >> Embedded Linux and Kernel engineering
> >> https://bootlin.com/
> >
> >
> > --
> > Takumi Ando
> > Space Cubics Inc.



--=20
Takumi Ando
Space Cubics Inc.

