Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44402904F8
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 17:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727345AbfHPPvC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Aug 2019 11:51:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41327 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfHPPvC (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Aug 2019 11:51:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so9989468ota.8;
        Fri, 16 Aug 2019 08:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpK+BMDExYLxKFIAWTqR3c4ZIHj/f9hQfV0Jcdwx0mM=;
        b=MWYM7g/OXsleqz7qMX+1+CvQGWnGcyArOW+uq2iELv5ajRCphvI32L5D6ME8DQwyQm
         0wvXU42fduQOUxvDniLMeGcTk3oh5c4C3MI7CHvUzp5OImAXN4/9lWLqhvh84TtK4h6Q
         sPJ2GJPbF2XaQOvo5tkBWW3wETyz6JkgVYvLl6/GCz02pisDdPmzkPe0vKXbWZHw4M9P
         Y07cqsZfO0DaWJRFOO9VOfe0ifO2WcxemwcTtErTiv5VU8wAOYs8ojk3BUgx94vstHPW
         gKBmAfWD1HpOFrr6VMmczmeMP6b6Btf0Ap+RewJNcmUBgBg+7JYA2nvu2THavgtjmQ6I
         +y4Q==
X-Gm-Message-State: APjAAAUZwv/Oc0BoA0qCUQrs8aIqRJ4x48Ln2CJQu98vSpqUT7x08WxP
        gZuGPNpFFL1Z3whnN5qvIk6YVLQVCzs=
X-Google-Smtp-Source: APXvYqx0ESOA+urswftHesiauGtTTZ4EtqnJDscxXNygBw8fflP/34zANjdq+IEjUQCR6SWqCnGOag==
X-Received: by 2002:a9d:6508:: with SMTP id i8mr8255954otl.355.1565970661625;
        Fri, 16 Aug 2019 08:51:01 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 20sm2260192otd.71.2019.08.16.08.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2019 08:51:01 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id e12so9941649otp.10;
        Fri, 16 Aug 2019 08:51:00 -0700 (PDT)
X-Received: by 2002:a05:6830:1db2:: with SMTP id z18mr4982946oti.110.1565970660637;
 Fri, 16 Aug 2019 08:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190816024636.34738-1-biwen.li@nxp.com> <20190816080417.GB3545@piout.net>
In-Reply-To: <20190816080417.GB3545@piout.net>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Fri, 16 Aug 2019 10:50:49 -0500
X-Gmail-Original-Message-ID: <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
Message-ID: <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run hwclock -w
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 16, 2019 at 3:05 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> > Issue:
> >     - # hwclock -w
> >       hwclock: RTC_SET_TIME: Invalid argument
> >
> > Why:
> >     - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
> >       will always check for unwritable registers, it will compare reg
> >       with max_register in regmap_writeable.
> >
> >     - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
> >       is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
> >       '0x30 < 0x2f' is false,so regmap_writeable will return false.
> >
> >     - Root cause: the buf[] was written to a wrong place in the file
> >       drivers/rtc/rtc-pcf85363.c
> >
>
> This is not true, the RTC wraps the register accesses properly and this

This performance hack probably deserve some explanation in the code comment.  :)

> is probably something that should be handled by regmap_writable.

The address wrapping is specific to this RTC chip.  Is it also
commonly used by other I2C devices?  I'm not sure if regmap_writable
should handle the wrapping case if it is too special.

Regards,
Leo
