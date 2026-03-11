Return-Path: <linux-rtc+bounces-6165-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IGfB1zfsGkuoAIAu9opvQ
	(envelope-from <linux-rtc+bounces-6165-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 04:19:56 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 778A225B5BD
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 04:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D13B30692DC
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Mar 2026 03:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5E72F0661;
	Wed, 11 Mar 2026 03:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b="uEAOhq7A"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D772E091B
	for <linux-rtc@vger.kernel.org>; Wed, 11 Mar 2026 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199191; cv=pass; b=rQfud1o+EGy/fhmEeeXCUWMv1Zvt+b2JeZHgq82f5fN2vq3i8Q30f7xTG5lWMgt45jeMw6GJGo+fwDG+df3893VCwinFYdOPq/cI4uWTiyxCfx9lU00MwpQS4NjNtGS71HeZ4dUwGQeh3VUYyiGoic3Ou6kj66c+mPxePteXZM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199191; c=relaxed/simple;
	bh=6XPkyNcinWEQs1+814GkT0YNoUFIKfplRVYib76vM1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZMqgukQU3dz8nICMzwCD7V/Z2RKkeZFPWR1gt62ry8NhhrjHkYvN241NnFu3RzgZNgSLLlvZfBwv5z1uc+lWbmkmOc2ybgFbuySAeEBF6LwTP8lWx36YidlZDMGWV99GEZOOYyyIQvYZ2KRoKQRB4n4bHhaVuhxCrQwNCY1csk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com; spf=none smtp.mailfrom=spacecubics.com; dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b=uEAOhq7A; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=spacecubics.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso2287310766b.2
        for <linux-rtc@vger.kernel.org>; Tue, 10 Mar 2026 20:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773199188; cv=none;
        d=google.com; s=arc-20240605;
        b=Npp4FbBdtPZ2pgpxr4G3esdfETm3qnmgfX0SCJXByRJIF8wkrguUpmhL4gTFAS3wld
         X7KyslnWb1LPSaznxTryvCtIH7hmSPKu7oF5138WzWgRcqDt2EDhyPBPjrq6++Nek3Uf
         S0QoX57Kmyn01h6oQR/9D6gVVqbPCZ9WQ4cObjuQJqw5gz3fuZzHjAF7flytw+1aej05
         6bNxGbUGtFcrxX8YlG0O+DilvWcLtZmQbDiVrTjUZ+KeDioteZXNCVOqIbDXhw42NlqA
         a7Ot1tA2iFI/qOgskvweKhN8o4Vio3NQuQaGKb30b3yZVU2Erntba9o6pPx0rGOfdkHU
         JbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6XPkyNcinWEQs1+814GkT0YNoUFIKfplRVYib76vM1U=;
        fh=gGrCH6P2J7iehKs7Gpl/UVPxPXYD+hBnQsqrv1vBGyE=;
        b=fVpqOrNA+jDWiwevWO0eMFWNf2OyxHMIC+qltdf4Amgaxys70R0FXLc4wtlcFkI+a1
         XoLFgAUNgRW481nH09XG9YC9f5pcBbEl/Jf1wolQtPj+JHR3Oc0VpCatH2+BPFHazzTc
         Y+JN03GHrhZTD/yb1am2uftLAriFZvhfcxjD5xRsDdhfyFGmnFzPVljS/K9luJt4UzMp
         QYErncmRy3f0Sg2fJJCGJQV28wS4LPhQBXZ/dIC5EkwJAMthOjyA7DMq9ModDjeG2inx
         CqaxytyoIkTZv//C2hVLoua3cBqrk75fMZQDg3CjGANes37qOulgyvtalz0MwLjJfp5p
         8IUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20230601.gappssmtp.com; s=20230601; t=1773199188; x=1773803988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XPkyNcinWEQs1+814GkT0YNoUFIKfplRVYib76vM1U=;
        b=uEAOhq7AJA7xM7z2zw+pv2JmvD8Vyxgs0Zvugbwa0iaiKMop9ZLDIeP+vsw8F1K6/5
         Z82SaeVMeU+I3TkLgy3/HSWiirPerZ0U0DW9zCiU1aTe2IqSe2beDPYsNFlTaXYVjMy7
         JaynYKwdFyOII66Olyh8atwLmjOAtOFdBc8GjsGELV0smQCTuQ1gfwzvZZ0QEz6nchET
         L0YYij1aEZNeXciG5ytWlXBMkH04IgIoHVQ4njWgq/5BZiHtKwRe+5DKPl7GHx+NJIXw
         oEVwZRkTVvV5+Eh2RhCWt0iV+q1MtfS+zB+5DQO7MVhC2ivlBP8KPSLHNbatG88xk1Mz
         eopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199188; x=1773803988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XPkyNcinWEQs1+814GkT0YNoUFIKfplRVYib76vM1U=;
        b=qeYxcFw3BLntY1REMUPcnCMwDrMvpK2LFAdzr1DG8emZUw9P8q4Yqnv41fJ6cdU1YR
         dndWTbe+pllEHSusbS65VPI2ZtUr1ewJ0HzOTasR7hZa2GyPcskk1gPztEbEY1dt2YkT
         dNkP1VvAHuRopB/4wFx4lusBQQFC65gVtAVR4FXMIIonzPzdKdvOjA2aumLmF8xQVt5S
         XNZDDQBAvXxM62QLIX/NmTnVFqpmaxywwQiZeaF27S51c4RFsoH7/hETPDLdv+zBaxcw
         4RHw598g7xm6jL+kXPsmqDkVIc9HUMURI3t4OxjYG/trn4tQvHV257lypB+aEfJF92CR
         uBWw==
X-Forwarded-Encrypted: i=1; AJvYcCXsCaGzxjQDi0oAXZDKsRp8N8Ym2WNpyAN6rPfryLoEnyxX+EhqGjuLG26Q38pB2usCsj25QJRlIyY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGzx2eVnqrrbVsS9e66U8r8Hc3+aa2O9okAhKCJ61NnwoY3Xsb
	Fpo50sS0vBj2EYqm6t7/eIlMnEPhI08gdK9hzmQ0/sTIvF+zgU2U8j1jVWWBudfHYR/GV9JdKMU
	t+XCoR3ooUT+fzNny4JvVM8/cPiUeKyXadthdppPL2hLjDIP3IQmmOLGU7g==
X-Gm-Gg: ATEYQzxRT7vmEUTyCKXUJIS9o59Z60vRKzIg7H9ZNKOxBsXfoCYWOcosmOski/e4IYz
	OZyT8w4EYEJ4iMqoWUUk5Bt03OGRoI10t5DufKsdNHzCLlEAirCAE+JYrt00xyKM9FCJhrppFeH
	yzo++A8psMZ/YxkaCJb3O77xvKdQN/DFW/fYSmYplzyGSRG09PgJAhFJct7Gq5b1uh40GutqSqo
	tfDK6IbDTNnt+d/U1O4FnqatLmOE0nQmxYheAuUS7lxjywR9CpQE9AKLFJ5UC56eMjdfUzK+MIu
	YK3aGae6
X-Received: by 2002:a17:906:fd81:b0:b93:60a3:8a47 with SMTP id
 a640c23a62f3a-b972e5e62aamr41125166b.45.1773199187880; Tue, 10 Mar 2026
 20:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
 <9ed6823e-b381-4de5-b1cf-98f5dc54bb7c@vaisala.com> <202603061113298cbba29d@mail.local>
In-Reply-To: <202603061113298cbba29d@mail.local>
From: Takumi Ando <takumi@spacecubics.com>
Date: Wed, 11 Mar 2026 12:19:36 +0900
X-Gm-Features: AaiRm50n2lMG-Qbdiue1T-QeEzMS8QRR0q5KQPp43eKXtFO1FzkeKy-wjiLT15c
Message-ID: <CAJACUaqHDJOZY-jgriGRX=DE=e3rvBgvycjO1exxQ7k1XdywpA@mail.gmail.com>
Subject: Re: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: Tomas Melin <tomas.melin@vaisala.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: michal.simek@amd.com, Yasushi SHOJI <yashi@spacecubics.com>, 
	kanta tamura <kanta@spacecubics.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 778A225B5BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[spacecubics-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[spacecubics.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6165-lists,linux-rtc=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takumi@spacecubics.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[spacecubics-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url,bootlin.com:email,amd.com:url]
X-Rspamd-Action: no action

Hi Tomas, Alexandre,

Thank you for the explanations.

So if I understand correctly, both on Zynq UltraScale+ and Versal,
CALIB_RD may return a non-zero (or otherwise undefined) value after
reset, meaning that it cannot reliably be used to determine whether
the calibration register has already been initialized.

While the fractional calibration should indeed be handled from
userspace (e.g. via the RTC offset interface), it seems that the
Max_Tick field should still always be programmed according to the
value provided in Device Tree, since it depends only on the RTC
oscillator frequency.

Would it make sense for the driver to always program Max_Tick from the
Device Tree "calibration" property while preserving the fractional
calibration bits currently stored in hardware?

If this approach sounds reasonable, I would like to prepare a patch
for upstream.

Best regards,

2026=E5=B9=B43=E6=9C=886=E6=97=A5(=E9=87=91) 20:13 Alexandre Belloni <alexa=
ndre.belloni@bootlin.com>:
>
> On 06/03/2026 12:09:40+0200, Tomas Melin wrote:
> > > On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
> > > CALIB_RD resets to 0, so the current logic works correctly there.
> > > However, this assumption does not appear to hold for Versal.
> >
> > For Ultrascale+ the calibration register also gives random values after
> > reset, perhaps you have noticed this:
> > https://adaptivesupport.amd.com/s/article/000036886?language=3Den_US. M=
aybe
> > the same can occur also on Versal.
> >
> > AFAIK there is no way of knowing if the value is correct or not after r=
eset,
> > so user space helpers might be needed to maintain the calibration value=
 at a
> > desired value.
> >
>
> Userspace is always needed to put the proper calibration, there is no
> way for the kernel to know what value to put there. In the support case
> above, the crystal will never be exactly 32768Hz and this value will
> change over time and also depends on the temperature. The value always
> needs to be computed, if your device can do NTP, chrony will provide the
> proper offsets. If you don't have a way to measure the deviation, then
> userspace can always forcefully set /sys/class/rtc/rtcX/offset if it
> doesn't hold the correct value.
> There is no need for devmem here.
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Takumi Ando
Space Cubics Inc.

