Return-Path: <linux-rtc+bounces-4644-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF768B1BC35
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Aug 2025 23:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A46A4E1EB2
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Aug 2025 21:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F7C24677A;
	Tue,  5 Aug 2025 21:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4MELk5l"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21EA219A97;
	Tue,  5 Aug 2025 21:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431045; cv=none; b=qPM9n+I3bWbnc3rC5z/kFbFnxY/fVKZi6zucIlUO4n7CxClv7AyyhpZCIpMsnhAMugxnvlYFbebGXWEvf2lbmiYXtFuDA+0OZnxZ5g5bpUJmSM9PmBlpCauPN8wD1HKyx/Kq9SsYcyAxjhcrvDNz/NiZvVSWn25Z9lA91247KdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431045; c=relaxed/simple;
	bh=ECguvNBrzTnsWKbsVPsSWV7MW0qzmKKXWpp9aBmCjb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C27OViif5QFeAcLuEt+fdwKId3ndz+l4btNgDU2gU5lM6/tlj8AZ6lEPbNu/Y1om8LFjLrr+H4D44lx9/WwtpECq8wTPHki8/1D7vp5DcvTRgZn65ItS+XqGMbFR3w2YXJCPDrLHUrRiqpcEPYOthPB1ETFQi8OIs+AQBqqZO/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4MELk5l; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-712e7aceb69so5998357b3.1;
        Tue, 05 Aug 2025 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754431043; x=1755035843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M08vr5V1FFY/VGEPTRbay5obQntnMHNlP/FtNo6AK/I=;
        b=j4MELk5lnX926Qs/yQRb/QnU+qfe8H8M+0j6hhkgHTTLz8ApTCkvOsBzPWFhnq22u3
         kgHimQoJ/TPYByNI+IvHBE6uUse5rbO8KIyhGap7loP0OaJmLp1H8mowTxnNw4R+Tx4y
         tXfID7htbIYBFa5rJ6/AV7aomVOP6qYeKcz9MrqQn+WlOxd6oqTh+GR/p0MVdcQ1DeMC
         Koug+cEIbpO+Gux+6e3KEiEkMJe/fbj0NVf3dQEwiArbarZmoCPXrDoFHzEP/7XyJgbL
         O7Os/8Zx1eCDpT1GVkxqebwIt68C+0hS2FfF2oJ08how4E2cpF+hdTDZflKJ533jyC5d
         +1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754431043; x=1755035843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M08vr5V1FFY/VGEPTRbay5obQntnMHNlP/FtNo6AK/I=;
        b=WxmdhEZIrrjjNEkMtVPT7lLF7yDCBGgIy5sZrOrcJnLkCXgXhqb5XPcAO1aZpCzR6X
         FvEIBt858dduHe50Fc0eZqKwXc9pqSZHjY+V0PdJm86vdzl+tOMau7GdXEZC86Hu7Ve6
         F50SCEqqcvu/ebQ5m/DWYHF5CoTHFWx/Ei73tHUuQKed7852Cw4NNh2ldAYE0ZykX6m9
         PpxauvE4aVYhUO9Yhdp/uu/ngS5xxhValITY01v9tdAW+ZjKHrD/8iF8y0bKusom2f2W
         PFy1wyt72ya8ZhuET8DjdJtGTP/oWZLlv/gaQMIzinEHY+xAjUdM7EFyrQCL6Esc9Mrc
         AWNA==
X-Forwarded-Encrypted: i=1; AJvYcCV/mMFQiX+UUhNr/mDL/pmuShiJfoOUDlg4UtVNXh18t/UXorvB9qIyGkziKoVcTHXNKZDj4B6/1kgk@vger.kernel.org, AJvYcCX6a/22pL+7ZdQFJY4Vb36VfC2yvYTQWvFo9TQncejnpQ1p0H2A2tnQD4Icez8nXRQPCHcdlsSorv30eHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzle/aT+xgqze8AgXkysMrtM+v/IkWEsWLVXPPLyqLgsxSonfmU
	c2+tucEyI4gKkD54C5LB7Vg6e74A4mZAfAY6JSJiZeFs6COW9ZNyxVogQXjqfAYdxdOL5UigN1+
	fkkWSxWhSZHBaJOezH4Zu4CFIABC+oo4=
X-Gm-Gg: ASbGncs9My7u3adiyIZ9CgG/MSX4j0fkmWavmnoO14WymZXM6S9o5yk3i70CqolmKGp
	i4D5SNhWZ0BUldeknQu2B9ezD+tyeYgn29wITIDZJ5apMOaq/c/OEQI2TRUbBAA19Y0b1lEjImH
	nbPILP/q2jUtlEwkIPvZaV6f7KGpJnN9OMjt7dNDJpPwMn+beWgNIcncZ4ANkP9MCkg3g7tx0zt
	T+UIuc=
X-Google-Smtp-Source: AGHT+IE0oDRKuT0yAxsfT5jR5C0o8KKHh1UoiOgUv9rrLYqZECBGuX0jYG/xbWF0ozPl1SXB/hqGYK2Fiq5iUVoCZ5A=
X-Received: by 2002:a05:690c:968f:b0:70e:53:676c with SMTP id
 00721157ae682-71bc9856e1dmr6469677b3.5.1754431042722; Tue, 05 Aug 2025
 14:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804154750.28249-1-l.rubusch@gmail.com> <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local>
In-Reply-To: <20250804213213d4844d4e@mail.local>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Tue, 5 Aug 2025 23:56:46 +0200
X-Gm-Features: Ac12FXzrW0QiDUGsuXzTSQ12buyuMB-0wmKeue68n0tCbDeLbdVTvyciEvta-Q4
Message-ID: <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ivan Vera <ivan.vera@enclustra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 11:32=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > From: Ivan Vera <ivan.vera@enclustra.com>
(...)
> > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > index f39102b66eac..0c063c3fae52 100644
> > --- a/drivers/rtc/rtc-zynqmp.c
> > +++ b/drivers/rtc/rtc-zynqmp.c
> > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_device *p=
dev)
> >               if (ret)
> >                       xrtcdev->freq =3D RTC_CALIB_DEF;
> >       }
> > -     ret =3D readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > -     if (!ret)
> > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR))=
;
> > +
> > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DTB en=
try. */
> > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
>
> Doesn't this forcefully overwrite the proper value that has been set
> from userspace and so trashes the time at each reboot?
>
Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
No, the time/date is not actually "trashed" (I double-checked that
with timesyncd disabled, having and not having register content and
over several reboots keeping a bogus date/time - it psersistet in the
same time space. The current patch always overwrites the calib
register content. So, a manual userspace setting will be lost after
reboot. That's true.

Would it rather make sense to extend it, say, instead of merely
checking whether the calibration register contains any data - which
could potentially be incorrect - also check for the presence of a
calibration property in the devicetree (or a similar property, since
'calibration' may be deprecated)? If such a property exists, perform a
re-calibration based on the devicetree at every reboot. Otherwise,
retain the current behavior of checking whether the register is empty?

> Isn't the proper way to reset it to simply set the offset from userspace
> again?
>
Hm.. I'm unsure if I understood you correctly. You mean the way as
described in AMD's link to perform the reset by executing the devmem
from Linux manually? If so, why is it preferable to adjust the RTC
calibration manually every time this happens, rather than to simply
put a correction value into the devicetree properties for problematic
setups? Or do I miss something, is there a config file for RTC
calibration for doing this persistently from Linux, that I'm not aware
of?

Before, the devicetree properties seemed to have generally priority
over userspace settings. Now, after the calibration rework, this
priorization seems to have changed and a devicetree calib correction
for such problematic cases will generally be ignored, with a
recommendation by Xilinx/AMD (see link in cover letter) to execute a
devmem command from off Linux (...). I mean, can't this be elaborated
a bit more to allow for a persistent correction method?

Just, let me know what you think about. Thank you for the feedback.
Best,
L

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

