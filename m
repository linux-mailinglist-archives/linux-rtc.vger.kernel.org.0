Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E61BE9B3FF
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 17:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436663AbfHWPyJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 11:54:09 -0400
Received: from mout.gmx.net ([212.227.15.15]:50847 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436625AbfHWPyH (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 11:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566575603;
        bh=FK/DtQ5Llw4RPvOVNrNip/D5BGMGtxLPTS+xnBnysO0=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=ieLXZPuofR8v8hpm8ouQ4E4j4buWbG1qRfYQQ0hGHWK3qRFJe17irZp5yOaWwdcWz
         Cqw5NsfccGIIwggDgq1Zrc6Ee2AYpn+xSihVMAKXF/I+eBbLMhT6z8/HuqjdOxij5y
         LVeecZRGXVqqQryYhy7Vo+BI+D16/sfPThpwadwk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.159.16.108] ([80.187.106.162]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MTjua-1hatYA3FTs-00QPrq; Fri, 23
 Aug 2019 17:53:23 +0200
Date:   Fri, 23 Aug 2019 17:53:15 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com> <1566531931-9772-3-git-send-email-hsin-hsiung.wang@mediatek.com> <trinity-1f82bff1-535e-47cd-9a2f-8faccb56e356-1566562433314@3c-app-gmx-bs11> <e8a918ab-3e7a-b487-db77-df28d56518ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] [PATCH v5 02/10] mfd: mt6397: extract irq related code from core driver
Reply-to: frank-w@public-files.de
To:     linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Richard Fontana <rfontana@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Eddie Huang <eddie.huang@mediatek.com>,
        Lee Jones <lee.jones@linaro.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-rtc@vger.kernel.org
From:   Frank Wunderlich <frank-w@public-files.de>
Message-ID: <4F1618E8-7D0E-41D1-AF27-5FCD2CFB41E4@public-files.de>
X-Provags-ID: V03:K1:jm5tZiQamB/MJ0W0uEyjRC5MhaRG3dAH20+JY9cKvyP2sW+tgeU
 LRA7Mbw/oroMo1SinJ8iZJeeSZbFOyNZyr77NM8YF1KH/QbDZmLLwlfnHmAUdDCHW8BQhEx
 r/s5t7MgBoJ1pATOm+l1NfxqpFJkfo/UbJqolBSsWouKmPAXR/h7OMj4P9pJiUE1YNP80+k
 JhDr69HXLz585HMGQrPjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Os/ILefmo4s=:e0nK4T51S/PYzI/jH+lnR8
 XWhG+l0ZhTeu8S617OptcTMdC+QWOwOZAjn2zq/GpgGqvQKPtX8N5SxzcyvhLw/2T0Nh8+CLd
 2Qnkz/lBkwXpZZT+hzcb6DEK0Fr8Y/vM30Df7Aplh8wRWm8KV07ywRQEPSb0d01nj0ekqV6kp
 VHeEDTei27alpTD96Kqp4QqSk0CFS7NN9NDpvTZTq7B6onY+kmThLdtnYrWruAXiGJoVWhkSt
 mdfw7O0IbD82LNOvoCdJD1uiGzZKLyUcYub2kYS8MOXtjeduVV+OBy/XkAdKZpAZPCCceRIMd
 QuIKVtfDlCBbSGMXauDYA6MJ2++5gCisgZVlm1BFnT2TiwIGQYQcYIswnf0SNlzfoT0gxUYqW
 pACXClE2Ewm9scILIB7C+jYZs2i1KRTdQxKmVyQITG6W6kz0AGVS9kFXe2frFJrza6HrGKRHp
 H/H7VTipdZ5hvs/0wX9HMAWcQdzG/7gSiHl0Q+QFWH7s0yeLqmjuRRE7XcZOIF6Cd6gj/UDaV
 XzetBZBTdw95tipLXgitzbtbt4WxP/Pdy+lW3v6UYcXVeXqSZrb6NNbLG1bRr7P355XWFDgOX
 MOY9LT5puXIKbUFn84K8r3whTb1ugcsaY9hij/idyXn+VrmDzotvctCsOYUoxgGnusyryiVFv
 jWODV3jj0qeY3Y5XXG0phUga12J1OWRmcSn81hEoPx9VRGA6Zg47BNWmbPrcExX5wJn83uaeb
 TUYCkNVxQDpx5B8AirSLsMz/qbCIE2ejT0Fh6Gw/vAVY8PMSkP6rGsnjLCJkkpkHbDeMHVIcd
 SNIGjgMoYA135wFhXydKFC9AM02pVd2j65E3+i1iRA8EK+cEbqXEf8TpQA1RVcVCjOzY7ZuGt
 sBn33DUUea1fpkQYNmE/1L3p5efTqBCOB5XtqXbQKoxEcn5spLlOUGhSrRQ3O1LorhJhfWAx9
 u2wXx2chGAkcfJC5kJKDh2wBzHZNxZOi/T9MeyuysJRZqjcnPVYLQWc4yY0MmvlXYFqWcjhdk
 d3JOxQc6k565BC5MokFrYSkw9Sd+t8xPOAoQErw4KNdTrT83ZlkqpQEbtxuLfHiqItqdUZg2o
 2OPYiJqDBrhOHRZj4hkz3qSUU+N4Y4XmLDoL4DDygNSkAjMuHP5UjMhKMvBI3vZTGj3AFwYF3
 p9TT8=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Seems chip-id in 5=2E3 is read here

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/t=
ree/drivers/mfd/mt6397-core=2Ec?h=3Dv5=2E3-rc5#n282

It is before platform_get_irq which may call irq-init changed in the probl=
ematic commit=2E

I will add a dev_info here in next-code to see value of id
