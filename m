Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB61E36CA3C
	for <lists+linux-rtc@lfdr.de>; Tue, 27 Apr 2021 19:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236713AbhD0RU4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 27 Apr 2021 13:20:56 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:45815 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236019AbhD0RUy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 27 Apr 2021 13:20:54 -0400
Received: from [192.168.100.1] ([82.142.25.254]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M734j-1lfaFZ2MSF-008WxH; Tue, 27 Apr 2021 19:20:02 +0200
To:     linux-kernel@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20210323221430.3735147-1-laurent@vivier.eu>
 <20210323221430.3735147-3-laurent@vivier.eu>
From:   Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 2/2] m68k: introduce a virtual m68k machine
Message-ID: <a9c75ae7-6023-6b6c-260f-a0d6841ea4fa@vivier.eu>
Date:   Tue, 27 Apr 2021 19:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323221430.3735147-3-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sX/rtXIi5HFyO2slzgGBdwOV7llxl+jRhOcOSfVR/K7V+VwTuh2
 LA58ztWttzkC7r2JvDXEVGtGXL1ohfdKM60o8U8qodVdzvPyxw8zOc3V3CZgCbTRVGPH6D9
 hFGX1RQ+o9dMEUaoyzUNqHRsjQPE41l91WR57IIjQekH+RI6S/6ODdhzfNYiHIa36wWczkf
 SCzPppAA/Yh+EGOlceaSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yUxnXIozo6I=:p0EVhQjNOZDnM482R7yLcD
 bXyTB6w1Ic4udfkVni3NQhO96qucqDWGHT65AEKlHS8digfPxaNTI1PXjQ7sXvovydXz/zgZF
 72VuT8Xd6MQid4LcImTWG28Po73Z/mjFaS9EowGp2l9pzdXMqJJR9Gh9oX1cxPtaw4KLSq2ra
 Zjf7lRWoe9zG02Enopq6yARGC1yJ2V9XtOw2T1bMEukgwwxBCIjFwGJ42UIrmChGL/ZqMzOVI
 D+ejKvU7ICKBCtkri4OHu9s5GNN9iG9jE30xQJSiUC65EADzc65nxmAnbir5FSMidvPBxkplZ
 1I9a0+/6pkV3npxBNcVOkIS8VElEDXKUBWUwlMIdaE6LvsWcP91C4hALWeJxhtzVnYUX42JYl
 Q7oRI1BNPPh2JguG1hRwFih3F9zY5kEJbZia0Lu/k+ivcJf+wM9HPI6tm1Rk7uKfBP2NDW1xy
 lPTI5REihWKrFRzUOR4uCM1jzNcLjGg6lEKyeqt09jBrLikeTVTK8oW2vqoVfbiU6Z0VrUaZz
 sUrxvmbAKFBu6nrOdQqKF8=
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

Le 23/03/2021 à 23:14, Laurent Vivier a écrit :
> This machine allows to have up to 3.2 GiB and 128 Virtio devices.
> 
> It is based on android goldfish devices.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  arch/m68k/Kbuild                           |   1 +
>  arch/m68k/Kconfig.machine                  |  17 +++
>  arch/m68k/configs/virt_defconfig           |  93 ++++++++++++++++
>  arch/m68k/include/asm/irq.h                |   3 +-
>  arch/m68k/include/asm/pgtable_mm.h         |   7 ++
>  arch/m68k/include/asm/setup.h              |  44 ++++++--
>  arch/m68k/include/asm/virt.h               |  26 +++++
>  arch/m68k/include/uapi/asm/bootinfo-virt.h |  18 ++++
>  arch/m68k/include/uapi/asm/bootinfo.h      |   1 +
>  arch/m68k/kernel/Makefile                  |   1 +
>  arch/m68k/kernel/head.S                    |  30 ++++++
>  arch/m68k/kernel/setup_mm.c                |   9 ++
>  arch/m68k/mm/kmap.c                        |  20 ++--
>  arch/m68k/virt/Makefile                    |   6 ++
>  arch/m68k/virt/config.c                    | 118 +++++++++++++++++++++
>  arch/m68k/virt/ints.c                      | 110 +++++++++++++++++++
>  arch/m68k/virt/platform.c                  |  80 ++++++++++++++
>  arch/m68k/virt/timer.c                     |  91 ++++++++++++++++
>  18 files changed, 658 insertions(+), 17 deletions(-)
>  create mode 100644 arch/m68k/configs/virt_defconfig
>  create mode 100644 arch/m68k/include/asm/virt.h
>  create mode 100644 arch/m68k/include/uapi/asm/bootinfo-virt.h
>  create mode 100644 arch/m68k/virt/Makefile
>  create mode 100644 arch/m68k/virt/config.c
>  create mode 100644 arch/m68k/virt/ints.c
>  create mode 100644 arch/m68k/virt/platform.c
>  create mode 100644 arch/m68k/virt/timer.c
> 

As 5.12 has been released, is this possible to consider having this new machine in the next release?

All changes are contained under arch/m68k and protected by the CONFIG_VIRT flag. This should not
have any impact on the other m68k machines. In any case, I'll be able to maintain the machine and
fix any problem.

Thanks,
Laurent
