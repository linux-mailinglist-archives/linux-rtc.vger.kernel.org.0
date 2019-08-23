Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A81FB9B373
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 17:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730611AbfHWPgV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 11:36:21 -0400
Received: from mout.gmx.net ([212.227.17.22]:46865 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726964AbfHWPgV (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Fri, 23 Aug 2019 11:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566574541;
        bh=vd75T/vd4ArUBu9LLpHkJoLc/Kt2E9SfiGvqFhhKu9E=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=PFDhZv8zZ4cZIpvkNCFUMAq+17D72PgDWucX7+CLVSkwyOL4/lMy3erhx/hpmsvq0
         1/lohDr3GB1u0z0wvFiiNpvqaXQ1shmmFGrXuW/tB6dhYLh1WFfWqZnm75XSzUyiha
         nuXVF7GYX4BbaTt9Bg5hVSCZYsrokU1/6AdJhjQ0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.159.16.108] ([80.187.106.162]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Mhhr5-1hotW33DkJ-00MuaE; Fri, 23
 Aug 2019 17:35:41 +0200
Date:   Fri, 23 Aug 2019 17:35:36 +0200
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
Message-ID: <285EC979-8472-4634-863C-E7A9967C9AD0@public-files.de>
X-Provags-ID: V03:K1:bL575h7X+tk6ewiOyq1Gud/GzAGlvjPNFuS8Ma+k+w6MxDp2tFE
 K0YCUniTUPdEUB5rmZbIv/CCyHeA0yFsxVDuW8b3JbaZLkwQwG42PgjoSMWjQQN38+xqI07
 OFIXUgK+qtZdR0BdbN5z7GiRA2DqPiV6wA3EZy7zQKP45FEeJc7URlnBGCg9BUt6twWLSMf
 gupMtRHUUge8Sib2t35rg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8hWNIA30oJQ=:sX3UEKaNIgkFhyhJyx2qYV
 0T1+XfwgFJjBTWHcIYcT3s7JIsmlcNpdQ8ovLlV9iBuGAO3dZWZ1PZuyYau0GNHB5vTRBLCYI
 ajPENZ+pdQMroqQdAa211D9SvilR7cR/fkIzVcnjLfAlmnuPdw8j+GQ5pyFbuEGqHq5biNrAQ
 OBNcMMQEnXsBZXH1878HaheIvGOE8Jmh/zzyih+Vr6oI49ArWtKy94/ZeEYHECe/rud5nZDkl
 WH48PtprMWDWjtYb1j5x150S+vEHVGY3Qwp+MCjlDz3HTT4FbTtakWdt8ovo40L8arCIf/Bp8
 ILx6+XjmMsW8DKaxtjPKEYVkVEfCWwutbBBVj/5i5eFKSrPCHD2U7JCNehZIIDAnmJJz2Oj0q
 GGmkUpzjG2+hRfgDskQjDkPktNlQ/bQ1nsZtmWv1MbqHU7HRpf1YXjSs40YZCWYqc2x2FssO/
 VV9mDfn49NsvoiEU6MNIJkeEHqQflkRPRxO8pMr67wIX/19ZVpE6LvHxtGfP3ifiwVdEBcdwX
 +T2A4hgQ3h/gl1O32CkcBzBB6Utu5Fjv7HWITX+q6uqqmhAy8+RcqhKlU2bi5eTc5kmYbJgki
 esCh8QEhOKK8LCVnBbylFXAZrrfX7t4vhW32EOwtHar61Z9i943nk3eRaf+RAPCglSNCT4yqu
 hMTe7yecGzyEqoInrIg6VTXE9n56JSJpqroR8Vjru7Lk2el6AjC013lp/Z/uoZwo5adS/d3fy
 tlqsCPXrRArS7Pl9nGbTJOepQ83jORe3DeF+bOf1Gnk24NdLQo/dauXYSonwB/VAUVAVxM1uL
 bim2FnxaRHkfkUmERdxyG2O1qyfUTlvxfCXumV98tvVqBgPPd9Vhtbtnsz/6XU8InNbfzFIwP
 V1jMtiEl6xlY4VnxoUaoWAaUn+0y9AySJugQVyS3zZo6tncS0nQUE+RsjqfandOXFYO4R5fZA
 0Rn+3UpzBlSXp32F6eqaa8JlITBXfiFtEd8y/b1wBQihIQWXRVMQcxHmWFzN0IyyDaDQinMNQ
 bKit6o5+HGAYwx0ib1wwMl85DCuOsqCHWkg0LIfkyvX5/1o+Kv9jr50Lxa0awgSTHH7K4VZ+D
 GcBPm7pQg4QAB9MNPVYcVCGMlcfbwHSRk2z5rDkFgaUjcJO944PFq1oGf+X0fWXm2ZZktTxis
 itMTU=
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

As far as i understand does old init-function not rely on the chip-id, so i=
t seems that with this commit a prior bug is shown=2E
maybe the chip-id (should be 0x23 like constant) is set later after irq-re=
quest or completely missing for mt6323
