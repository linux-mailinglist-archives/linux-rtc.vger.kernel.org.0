Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00CB6CDFA0
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Oct 2019 12:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfJGKuQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 7 Oct 2019 06:50:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41058 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727334AbfJGKuQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 7 Oct 2019 06:50:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id f20so11912089edv.8;
        Mon, 07 Oct 2019 03:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ppOuKjPO6i7wx6h4LdveUxhi4iywh8qVdyaLhYSD7Vo=;
        b=F/RVNSeCdl2fHRXmCNIzkmNFNVR2+5sk5xZ1bqYRpirFbUc+KqoaxcOiLfyD85dDxi
         isBk7gNaYClOYKf3cYWTRVMImZIj4MKmvI5dkmsMjeKVUAB38tCaRw4soWTzMeIVXVUA
         yUHW68eSLIp6pgGravs/ZF/tUu7qOFvSrY/Csw7SVrJHgbgdo8wczrz1IiL3GDD3F2so
         qmuxIgQWohXWNhfEuaSVMtNX0oRPZP1pvn7Oiwgrogrdb2G65Eco0bfjDfcRab5ndBPN
         YSVTASAHFTsy14RWCTSkcaksNSm/IQuGpgRylTeMUtRX3mGp0YeRNp+CGFjuj7ZlhbRu
         n97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ppOuKjPO6i7wx6h4LdveUxhi4iywh8qVdyaLhYSD7Vo=;
        b=rbYka8YPgAIDc6h2kxTMiHT/jXBJMimxN07ksWNXy2khos0g93QLni+h4/KW+9PHfh
         KiLyJl5wndXOClJUKPz3JMjzrF1r3UR1aHXcAni3jYdWeUGOwxrx2mq8leofmej3UTN0
         Wk2O5Bcwy/CYA+3EmJtJtJrii90Z6Nl8at01e7HQKHAe+T69W2XIMixpOPH0+V6JFHk4
         m22Fb0zjMtyHIL/wVmkiq4DaWBWdAJMn4QYS14TqyTY1aHu/2AqK3cXAEqBA8v09iOO/
         Pb+YNUjFXox27fbI+hRD3TLA/Lcdtf74GsPrzawmtHNn2jTftSwDxBH+7oOxm2GSBe+p
         ZVAw==
X-Gm-Message-State: APjAAAVdq5SvFCMELzaxNH8xOBjpZxmLgmFgZtyc17KOKCV0N5fl+fb6
        N/geJOVVrsIa9YKCn8T/8MLqbE+Pwqi8jvXoJbdiciY3
X-Google-Smtp-Source: APXvYqwTs4bBgFhuFeZmzNvC9Bls3dbgARfOfLKclE4MJnkbtrgeTeZkGs8ZcAfIQSLNSgIhujqFixcyAMrILfQp0ow=
X-Received: by 2002:a17:906:7687:: with SMTP id o7mr23349972ejm.213.1570445412878;
 Mon, 07 Oct 2019 03:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191003124849.117888-1-martin@geanix.com> <20191003133351.118538-1-martin@geanix.com>
 <CAH+2xPAtxcxd1xXuCmHc25X-Ai2_w-5rxZrgYbavjAzntMxX-Q@mail.gmail.com>
 <f741d1bd-bcde-d1e1-09b7-98bb6a30db33@roeck-us.net> <CC1D25DB-F95B-4110-809C-E8BE1493CDB7@geanix.com>
 <403595f7-99b4-142d-b4ff-7c574a3974fa@roeck-us.net>
In-Reply-To: <403595f7-99b4-142d-b4ff-7c574a3974fa@roeck-us.net>
From:   Bruno Thomsen <bruno.thomsen@gmail.com>
Date:   Mon, 7 Oct 2019 12:49:56 +0200
Message-ID: <CAH+2xPDkezVexmJRcuMmZ-vFbmw6CjDn3k4_SUNw_FNzy93AgQ@mail.gmail.com>
Subject: Re: [PATCHv2] rtc: pcf2127: handle boot-enabled watchdog feature
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Guenter & Martin

Den s=C3=B8n. 6. okt. 2019 kl. 18.19 skrev Guenter Roeck <linux@roeck-us.ne=
t>:
> >>
> >> This should not be decided on driver level. The intended means to
> >> enforce
> >> an initial timeout would be to set CONFIG_WATCHDOG_OPEN_TIMEOUT, or to
> >> use
> >> the open_timeout kernel parameter.
> >
> > That, and WATCHDOG_HANDLE_BOOT_ENABLED
> >
>
> To clarify: If WATCHDOG_HANDLE_BOOT_ENABLED is disabled, the watchdog cor=
e
> does not ping the watchdog on its own, and Bruno's argument does not appl=
y
> in the first place.

Thanks for clarifying.

When reading the WDOG_HW_RUNNING bit description in kernel api [1]
documentation around line 247 you don't get the impression that the behavio=
r
can be modified by 2 Kconfig options and 1 runtime option. Maybe add an
additional note?

I am overall okay with the change, but I have a few extra comments.

If the dev_err message is kept there is a typo in register name: wd_val.

The variable name wdd_timeout is a bit misleading as the register does not
contain the initial timeout value but a countdown value, ex. wdd_value.

Bruno

[1] Documentation/watchdog/watchdog-kernel-api.rst
