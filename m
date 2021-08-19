Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3346A3F1DBD
	for <lists+linux-rtc@lfdr.de>; Thu, 19 Aug 2021 18:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhHSQZC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 19 Aug 2021 12:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhHSQZB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 19 Aug 2021 12:25:01 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5128C061575;
        Thu, 19 Aug 2021 09:24:24 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id a20so4387765vsh.4;
        Thu, 19 Aug 2021 09:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1eABnccWnkdvKp0VYPWsgpSEMyR2grU/+yjUebu51Is=;
        b=M+Rf1OaLimzNdh1ieWjWCBK9A3/VDBxtmyzp6JPsnL2L8CVbFVTgumuecHRsiwlf3o
         d0Up5VoddU2givGZpaaXyuQIc0bml91oCOMzWSHuguQLIR95cMVPs+85MGOAZt9ZBNWj
         StnEgc0QYwc3JCrKY9YyRO2d+Yd1k8xhkAXBNp/1M2SQngKC3e5/SZYTymetuWM8FVog
         lFUYNW2q0sSakjUI31/xQT7JbsuCA5xEGH5CRGxX81HXEEmxGjFHiFjuiKFaSuZg9mky
         SIdZprcGSc9oQS76brh1k9/6OUYxkjD1bKd98JTygEtMwBOp2KDeq+eJXaifD3uLFh2C
         0J6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1eABnccWnkdvKp0VYPWsgpSEMyR2grU/+yjUebu51Is=;
        b=skNI+3Ooawq4h4X86gL19wkq5zT/0yZc9AWEmJFQeus7Fl9nvDTiW5KNMAXhDNOK1b
         +vs72rbMzqNLy/3/jSQ3TZL0fttTizkiQmJz2ddPSYAmmHX+RtgK5dfyuy90BPCuIplx
         2R1sVCcB2sBoI5VRTkXRpAkiWGb9VDUyIgsQVrfo9OAoDnVDt+SdGtbGv3eWbqvWtUmt
         DhPSlFc60USdRyU/WEWrdMpg2qJD8fOjqAcuRpVl2Z/41Z0wJcC22sWoBP/Q/EfhUOTf
         zM+njKRd5o6NZMCjL3OSpMk/MJZQ6nRpfd6CA1C6isJPZ7PJ1LEjJ8q6Vr8Rnhzcffyq
         +dSQ==
X-Gm-Message-State: AOAM532XOw4ohOAER4+kdSkHW2n/Kh7DHuXHgqx9NAln+YAkQy+mklyV
        fLEgx8QtUzkg++SgTNXOawe+kOVO17N1eia3tpU=
X-Google-Smtp-Source: ABdhPJyBtkayUi8TfEEFSkwE1G5WxSdbMPI4p2Fne9Gi2gHtSueAClCp0JOu+HEiwPXesN2daduVajJQkzGYXPgxhwc=
X-Received: by 2002:a05:6102:3021:: with SMTP id v1mr13245379vsa.0.1629390263880;
 Thu, 19 Aug 2021 09:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210801160921.233081-1-romain.perier@gmail.com>
 <20210801160921.233081-2-romain.perier@gmail.com> <YQ2riRW1hZmn6x4B@robh.at.kernel.org>
In-Reply-To: <YQ2riRW1hZmn6x4B@robh.at.kernel.org>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Thu, 19 Aug 2021 18:24:11 +0200
Message-ID: <CABgxDoKYo+_8O+gzGpj0boj4mKRbStbPitZrVzznY_wmq1CGZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: rtc: Add Mstar MSC313e RTC devicetree
 bindings documentation
To:     Rob Herring <robh@kernel.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Palmer <daniel@0x0f.com>, linux-rtc@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Le ven. 6 ao=C3=BBt 2021 =C3=A0 23:37, Rob Herring <robh@kernel.org> a =C3=
=A9crit :
>
> On Sun, Aug 01, 2021 at 06:09:19PM +0200, Romain Perier wrote:
> > This adds the documentation for the devicetree bindings of the Mstar
> > MSC313e RTC driver, found from MSC313e SoCs and newer.
> >
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > ---
> >  .../bindings/rtc/mstar,msc313-rtc.yaml        | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/mstar,msc313-=
rtc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yam=
l b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> > new file mode 100644
> > index 000000000000..62bc12b1feb6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/mstar,msc313-rtc.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> As checkpatch.pl will tell you, should be dual licensed.

Arf, sorry for this, I have completely missed it (it will be fixed in v3).

Romain
