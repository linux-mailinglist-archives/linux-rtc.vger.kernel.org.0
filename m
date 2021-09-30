Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD09C41E31D
	for <lists+linux-rtc@lfdr.de>; Thu, 30 Sep 2021 23:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348880AbhI3VQg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 30 Sep 2021 17:16:36 -0400
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66]:42339 "EHLO
        outpost1.zedat.fu-berlin.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348652AbhI3VQg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 30 Sep 2021 17:16:36 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.94)
          with esmtps (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1mW3OF-0042kT-Kz; Thu, 30 Sep 2021 23:14:51 +0200
Received: from p57bd97e9.dip0.t-ipconnect.de ([87.189.151.233] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.94)
          with esmtpsa (TLS1.2)
          tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1mW3OF-003e2L-7n; Thu, 30 Sep 2021 23:14:51 +0200
Message-ID: <506fe100-04b6-e465-f4b8-bae58ab505ac@physik.fu-berlin.de>
Date:   Thu, 30 Sep 2021 23:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
Content-Language: en-US
To:     Laurent Vivier <laurent@vivier.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323221430.3735147-1-laurent@vivier.eu>
 <20210323221430.3735147-3-laurent@vivier.eu>
 <CAMuHMdUFh2W-bY5Ez1aOTZQjq0=THvmOf22JdxWoNNtFLskSzw@mail.gmail.com>
 <90ab81cd-0d83-9537-b7d8-40e4bffa152e@vivier.eu>
From:   John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <90ab81cd-0d83-9537-b7d8-40e4bffa152e@vivier.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.151.233
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

On 9/30/21 23:11, Laurent Vivier wrote:
>>> --- a/arch/m68k/Kconfig.machine
>>> +++ b/arch/m68k/Kconfig.machine
>>> @@ -145,6 +145,23 @@ config SUN3
>>>
>>>           If you don't want to compile a kernel exclusively for a Sun 3, say N.
>>>
>>> +config VIRT
>>> +       bool "Virtual M68k Machine support"
>>> +       depends on MMU
>>> +       select MMU_MOTOROLA if MMU
>>> +       select M68040
>>> +       select LEGACY_TIMER_TICK
>>
>> Can we avoid selecting this for a new platform?
>>
> 
> I tried but I was not able to have a working scheduler.
> 
> As the machine has been tested with this option and most of the other m68k machines uses it, I will
> keep it.

FWIW, the VM in its current form works very well and reliable and has been
in use as a Debian porterbox for almost a year now without any issues.

root@mitchy:~# uname -a
Linux mitchy 5.10.0-rc1-183617-gd7f4e16357f6 #1 Mon Nov 2 12:06:55 CET 2020 m68k GNU/Linux
root@mitchy:~# uptime
 23:13:47 up 332 days, 10:04,  1 user,  load average: 0.08, 0.05, 0.06
root@mitchy:~#

Would be great if we could get this feature added upstream so I can enable
this kernel configuration in Debian.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

