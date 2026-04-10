Return-Path: <linux-rtc+bounces-6311-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO0+IA3K2GktiQgAu9opvQ
	(envelope-from <linux-rtc+bounces-6311-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:59:41 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994A3D5531
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 11:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CADA03005AA9
	for <lists+linux-rtc@lfdr.de>; Fri, 10 Apr 2026 09:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7273ACA75;
	Fri, 10 Apr 2026 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rErJRG4Z"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1D21CC5A
	for <linux-rtc@vger.kernel.org>; Fri, 10 Apr 2026 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815175; cv=pass; b=pwZJqez7oV+3IRpj70Jz5sKxqAhiAwASVjcdaLVENylRzGED30iESLSLQBNBONFxl/quv+Cnuqx9sq6EDHN433Jpo4Czs7QS1Pomu5xMSaLq0Pvh1br2+VZUFTHBmWYMBmGM/47GKtw6GtDhomKJP9tBbiV7tWBk6q93LF9jpck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815175; c=relaxed/simple;
	bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+Xnu9SBFwS5xUJ4smqvjGKWUfHUCGisUg9tK4cl6iCPfPjsqseEVEmsg0+7P3mBm5oNull7p2ugO3can+5Mg4k2d3inq0o4ulh8AYrV3C9T7l+2yO+dNAahAAfdZ0vZFlVUf0a/DSWlf3ObMlgH6OWy0maRfsOyTPDFNcpBElY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rErJRG4Z; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a7109f568so21619287b3.1
        for <linux-rtc@vger.kernel.org>; Fri, 10 Apr 2026 02:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775815173; cv=none;
        d=google.com; s=arc-20240605;
        b=PPEjKgWcOiNSAqLPJktuWRWsiJaYjWTC6yljuHoUjJrODjW7DaQoUaFdKtGgGCEaXh
         I+0xGuZASvNhQoytAXdYFkrx9k1uR7AiTLTGo08SpYNi1O7Pqugii0lT8vDQiXF+0mS8
         zxTrx26DJyGeuoKumwUYsPUIH/P0VV5rbbxCsUQRIcN3LwPSwvUFfCcRsIH6wkrmSZJ/
         YefXBEuz+2MPtNwHw0f7WYo7F2vww2Phza63dPGB5Bjq9m8Q1JE/9aZAp2B8/GyztgtC
         3kOCKzpG5EU+dxDGfZtUWMTVpHDN2UrtzVOdVl7lfqfEVIxb0E7ZbFZV3ZkEZFXHmjtU
         aZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        fh=/oul19byST0vT8AjFxd0O99vrqZ1D+9h3k8ax4Xqo0I=;
        b=XuhOZAAgZzaqOdysJgZW0bWTKWGYPJgIsYKhUl3omCTxH8RskHhHCt4RRQ3YDghRid
         oYrfBaVCibT+xkm8e1PHEUvjoR2aJERmgGaeM829RYdZ2HEE1nvZiAqJ8BAmOgXRYIWG
         lllXqS+qB+ZYUqER4+yWTQeFD7VdX7+/5foOioSV8fzhvoGJ63rIen2L6GWvpdPukFRl
         HY1eMIW55pY0coI24hiN53xUbAfGI8EgnnCjkareHTfvtfVpT5jPI/Y9kOiX0qmzo9jj
         VJRShUWjXt/O5XKY+r4I68S4IRpJkfPI0OEFpWRcHTg2fMl9/9b1UrK2NijK4N5rRfCV
         djcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815173; x=1776419973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=rErJRG4ZXVbUQMFbRFnmhepxOtcXBpodg5RLaOgBH+BoRSymMMJ7ImR40QJedCzbyW
         tMf1Kw0G48yG1WZj+bNeo4MywgSjIiHC6+mdUiWs/1trlCFn5wz1/AAEssiw7iJpV45I
         HfNU8cXmReN8Nsez829lTb/TBvUrr77OsqHawEgFSQ6vY1oOAVLWJ0U/Z4+fMTe/VFCg
         IR23/Yp54EUoq9dhxidWHZuyoQIaTlIzdzfge5/sD4+zoIksk5Yd0vqptdZ4fGSwlDMf
         y/S/uZCe8K9ouwDdws1zrrxjoze6PKxwMOQ8PgDitKmFK8vgUphQisVdc+pg/trHdpwt
         wTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815173; x=1776419973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2Ytf4PmH2myigvUKMqYUbjaDrOTgHCXnYH7NNPpZ9Q=;
        b=m9lOE+d8yRXxK8sESiUohyLTWiy58c3SAMFA9+ICQyMm4yZZawKffY8RUBN4odKxKD
         zc9n2lya4ZrR2CpGHH0CsPA6GXtwea+ElkMJXdhs04LIwNhUPH8ILcQe1cNkb77uWDw4
         yAFTlq3p7bIOCNcO8BllA4EGucHQtVZQzcPF0m8qvGYIyhd6RwapMTQkDPY+9tSXdrA/
         oJqb7qz3VXPzRprUV9nxO8BU+/Tw4jBGp+sh5QdKYjhRk3Vu4f/cGGqO+KoVAY7tiZuM
         PF6ib1U9n493+mwiUXPv+ei5Ls7ZkTDVNXSmsyab6L0QdMPWdftlJBBIcfDquN3aNo7o
         OHEg==
X-Forwarded-Encrypted: i=1; AJvYcCURLJaiRxa44BFVr7hjtrZxkq9vp9xTrcbkOkwhaXaRUC8d7w51042Vw3ZybObA7jh0sBIesHXeU1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzywi3Q6CsxTPI7TeN9P+PjeHGBemZBQ+/Vj96oAp6uK8w4DAHu
	cSfSsg2zuRDod1gDblRGwhJg1ZrLkA94lPlil0Dt0P4jJbPuWYgrYHm3fEJLJA23s/QW7bBtoTl
	zY23ACZAkWFsjvGNFtrzwJ7chd2L+Fzs=
X-Gm-Gg: AeBDietRhSTiVNB14hZJAwnAxN05L2bb0b7ME7A2l0P+q2ihsvUCtsXd8x5bmoSSNSl
	UFNi17AhCHvwy1H5K5oPTgUVAdmE+DgH1yHAIsiXOLXCWJ3FyjfL7JjdYBMGGylrM8FttTmX0Hf
	EUQWEuYGfF8fMoUgGy+VGiIWXrTwmR4uxlYPyn4jPem/Rm4HOMY9DkdawlkUe6LqnyfB7xWzs4d
	e0TDQpj/CCqn/NgPVVBTaYUXvml7ZVXQRAD2XFiNDm8hLf21g6DOw5qfHf+u0QJZRbdGdLzL341
	zXgl4M0PV0i3Eg7wGFd0cx6c+Is9SLA2IItOMTXQsA==
X-Received: by 2002:a05:690c:83:b0:79f:3715:1980 with SMTP id
 00721157ae682-7af6f907f77mr24281587b3.12.1775815173216; Fri, 10 Apr 2026
 02:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408053037.1867092-1-a0282524688@gmail.com>
 <20260408053037.1867092-2-a0282524688@gmail.com> <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
In-Reply-To: <CAMRc=MeJL_po8HuBa4btVowR-e0i2FyzbDgNVo2u54iPKyuvWw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 10 Apr 2026 17:59:22 +0800
X-Gm-Features: AQROBzChhaENjKRgm1eiXEkKC5Ek3HBghHXiZXP2Ngye9h9-wWZ61ho7Hz-V2Tw
Message-ID: <CAOoeyxXqUbdd3Y0VorzVVOARVpoEkx033sYrv5Hs4tRfst2tOA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mfd: nct6694: Switch to devm_mfd_add_devices() and
 drop IDA
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: tmyu0@nuvoton.com, linusw@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, mkl@pengutronix.de, mailhol@kernel.org, 
	alexandre.belloni@bootlin.com, wim@linux-watchdog.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6311-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0282524688@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6994A3D5531
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bart, all,

Thanks for the review.

Bartosz Golaszewski <brgl@kernel.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=888=E6=
=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, Apr 8, 2026 at 7:31=E2=80=AFAM <a0282524688@gmail.com> wrote:
> >
> > From: Ming Yu <a0282524688@gmail.com>
> >
> > Currently, the nct6694 core driver uses mfd_add_hotplug_devices()
> > and an IDA to manage subdevice IDs.
> >
> > Switch the core implementation to use the managed
> > devm_mfd_add_devices() API, which simplifies the error handling and
> > device lifecycle management. Concurrently, drop the custom IDA
> > implementation and transition to using pdev->id.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
> > ---
>
> This does result in a nice code shrink but I'd split this commit into
> two: one switching to using MFD_CELL_BASIC() with hard-coded devices
> IDs and one completing the transition to devres.
>


You are right that this change is trying to do too much at once, and
splitting it as you suggested would make the series much cleaner.

After looking more closely at the ID handling and hotplug
implications, I realized that switching to devm_mfd_add_devices() and
dropping the IDA is not a good fit for this driver. The current
mfd_add_hotplug_devices() path uses PLATFORM_DEVID_AUTO, which gives
globally unique device IDs and avoids sysfs name collisions. If we
switch to devm_mfd_add_devices() with fixed IDs, multiple identical
NCT6694 devices can end up registering subdevices with the same
platform device names, which would break hotplug support when more
than one device is present.

So I think it is better not to pursue this direction further.

For the next revision, I will drop this part of the change and keep
the existing MFD core logic, including the IDA usage. The series will
focus on adding the nct6694-hif MFD driver only, and I will add the
IDA initialization there as needed.

Thanks again for the suggestion and review.


Best regards,
Ming

