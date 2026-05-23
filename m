Return-Path: <linux-rtc+bounces-6566-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEpuM7vnEWpFrwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6566-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2026 19:45:31 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C75C019A
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2026 19:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FA683014C0C
	for <lists+linux-rtc@lfdr.de>; Sat, 23 May 2026 17:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1423C324B32;
	Sat, 23 May 2026 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWjNp6Dw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10D26F293
	for <linux-rtc@vger.kernel.org>; Sat, 23 May 2026 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779558329; cv=pass; b=u4bAFORwBt4cRd/QsPMfRq4wVY3kjzAmuE3fvqfIj5RNJK4/8M51LG7sWqTme0oVXyZUv1bSRgiASWX1csOPtMfeV4podaNCmDIihFyHUrv2F8Vti5kpLpAEo/IMX0hzr6iwJtSgaJgY8D706OmtgXpco80HoIjD+CF4UUv1cAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779558329; c=relaxed/simple;
	bh=30qE2V9NVO+88aShbtnmqeHFmuLpQVCvOfMMZBUbTqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TeKTA8FQZ8d2w4ZEDl3Mp7TPpNAmuUZRkHRt7VowxuwwQAZ7n/2W02j6rLIkzmk3ghQr5CSbuom5Q0KWCogxUGdIVzG/KYlSEAx5YWyJgx/XIjLR4UTdv+RNvZxScDZx0gFvgH5yz2iITwAMjkeZ4lCwTAvC9dDGmulsxt3RzVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWjNp6Dw; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7d1bcb92072so34243027b3.1
        for <linux-rtc@vger.kernel.org>; Sat, 23 May 2026 10:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779558327; cv=none;
        d=google.com; s=arc-20240605;
        b=W8PIdaX5TZgI+uiaiAYMAX38j9guyXqu7uRTJMS04I1PDO5Hq5V5RqQ2q2JdOCHHxg
         ngWic+rCFWsMgjt01hUO4gO84CKqYBvjdYw+p7eQn9FDIeZHVj3WK1BfnaWeWJyxxCsR
         jO+8jmWm7MTD/Sn0Xb5bg9N16p3u9Ew1e/mr1iQbjYzvzLIXWPgG2eXKZpFFMW5lk8A8
         NbH89QxpCJQkUGAMjCCUu7Ha4sfcE/BO5+mjF0ik33NaghrCnBPhIH3GZ0ch1IIU9Y11
         iJvkSRFrPRiOMVGUy1eDtB+3Weci+sT4i2e04AP6TRtLHbVXqhuGXKopWEmimIw20qM4
         XhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        fh=hKys1+ISSICAMOr7ty3DblyUPoSLzRdIDiqQzjoHTzM=;
        b=gSi9P5s2IBMmkeh+54TCvESFZTJMsgFpEQcTeN09PTZlpvW+K7SJwRKanZxiz2sKpc
         odt68NxV9Bej8mnkep6/grp8U1y8VOlmga+B2WOTIArCqRXJ3LZfiQg0xyjePE+tEaNH
         Y4JMzp9mpzJyaTdSrarrBSYSiZHDdE3CVOWXamc0Li8FwsqNxjIjj3GJrGHOtTpaaQVk
         RgwnjhLGUASO2DJXnRmPqA92R8jQ88O0Un2BdxCf1ykoeb6eEyAxp/vzxy7vEBsdKfD1
         80Ijw5tcemEWFXtz1UTwGDGyQtGZI/B+HzEhOSG1KAEe7g1uh8OxJFsBYHBHPrj2GwL/
         t6MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779558327; x=1780163127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        b=WWjNp6DwHH7aDKdiq4cI94OadOeRAcpyLQBJOzI6Ef9ISg0GvHjq1azOX1m0iSOl0M
         0Dd+O3MRspClVFh3H0dwsgiu6spfhb3zhKld+ovWl2CTUkStKKSbKkTIvFnLXv3nAJVR
         dUfYHuv3huZWZUGZmJPH0cVe/JXsXZ6n7J5n37WxD1D9U66yE8B7/v7VZtP7DCu2gb+B
         +xc4ZIS94MTJQuBEbEPYtMM8MN/zErUrPp+N/2cWXOBPoH4y7hjVRlsG8UczLg9ghse6
         jrymuNTZ5c/HbLFBoXi1xpxP9BEqrNsEgdDH672dUQ8948/vL5UsAaaPeE+eAHbsChWt
         SOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779558327; x=1780163127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S30KCShoOk9+TF7BnTVcfhMPspLJom9j2jTzmoQx+Xk=;
        b=tLS0CAFgb9q3n3qK3BJxESpsYoCYf6lkECUTGeKTpsKku2R/cZlY7ROlXXYP4uCtNX
         oMQCrsd7u/N1n7ZBBEu8OftOiP7wmbDKflUJDzUWnG//oQ8+shRMC84cj5t/6SWb185L
         T17cqZPz04zAG+0mlQ+y4RRvqGaNWdeV86Rt49j2JTLlw8AWMDVFxDfL3KXA5rR91JLW
         nfkQApCXV5BIw/kw4vQ7+RdjX12Q8ekX08zbQL+x1Syr8j3f3Tk2/AkJgtPMI+WR50A8
         Ny8/X2dbZYk5kAPINBMzgYXGEAYR+5fLkEIsqgFmer30Jlb7hnfSINzZfA9HU8PRbrY9
         gosg==
X-Forwarded-Encrypted: i=1; AFNElJ8oSV/ZnUBYruu8DKAw5yd4H/Cuzzu4hAN4PZyRCc+7jflrLWmv1SAzzFJ2Q4NHzeqrk9G5CB7bSTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZtGuQpeMkYavwurm4xBUWYyHIgfEjVcwaLD2q6mIY2/crPNxt
	B6SJzq2z1pA9CGnZPuIzHIglW2oMKio42pYYMlyrc7H7T89HeqD1Oqyv7Vxlk1Wes9VoviUIhPB
	Ij2HMi4SI6wLtwjmF6AEXiX/h2CdO1Pc=
X-Gm-Gg: Acq92OHFyIQg84FuuO7hBGELRnMl1zXjv31DOrEHTVJi8JmRS+ER5+yWyiZtNRa728T
	cmSbTnahL2aWsnKNPiFml4SDWCTqSE42cuB/BXOqAfKV8C+hCoFqi5znAyETDo/j4XeVTKJWLkT
	Lu2kMbBC8wj7eqyBjovQabJ5avlGlhP5w65JtkroYtX5Qf5+5nyNYJxdPmf0WS2DlTE5q6WYeLu
	20I2KLivhhYdwPpEf4s0nTgzStrcX0LknVXkrVlGf0GK7yxhiRfwRuHEOvS7Kgiu+KiLMIkMlPe
	jF78exoM/KHRrj+GH7brYyT8TeWi6huUnNjuVEr8
X-Received: by 2002:a05:690c:48c4:b0:7bd:5cc4:3e5c with SMTP id
 00721157ae682-7d337dae355mr97303437b3.3.1779558326833; Sat, 23 May 2026
 10:45:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521170810.19702-1-challauday369@gmail.com> <20260522-passionate-fair-jellyfish-73b2ee@quoll>
In-Reply-To: <20260522-passionate-fair-jellyfish-73b2ee@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 23 May 2026 23:15:15 +0530
X-Gm-Features: AVHnY4KKLnNMVSOZQqZWxyunj-wEHbZCmEdM2577reR9I9fHhYK8DkVmvOBbi2k
Message-ID: <CAAj-GBke+Jmt1m=qgTUBtZfCB6AVVmSHi_+S+wciEbvf0v_M0A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6566-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,0.0.0.200:email]
X-Rspamd-Queue-Id: 287C75C019A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 12:12=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > +
> > +        plla: clock@200 {
> > +            compatible =3D "wm,wm8650-pll-clock";
> > +            reg =3D <0x200 0x04>;
> > +            clocks =3D <&ref25>;
> > +            #clock-cells =3D <0>;
> > +        };
> > +
> > +        clksdhc: clock {
>
> Entire binding is for part of other device, so where is the rest? This
> should not be done separately from the parent. And then example goes
> only to one place.

Thanks for the review Krzysztof.

And sorry, I initially converted the legacy clock/vt8500.txt binding direct=
ly to
YAML and missed that the clock nodes are actually child nodes of the PMC
device, which already has a separate binding documented in:

Documentation/devicetree/bindings/arm/vt8500/via,vt8500-pmc.txt

I'll rework this by splitting the conversion into two schemas:

via,vt8500-pmc.yaml for the PMC device itself
via,vt8500-clock.yaml for the clocks child node and the PLL/device clock ch=
ild
bindings

The clock binding example will retain the PMC hierarchy context, but the PM=
C
properties themselves will be described in the PMC schema instead of
duplicating them in the clock binding.

Regards,
Udaya Kiran Challa

