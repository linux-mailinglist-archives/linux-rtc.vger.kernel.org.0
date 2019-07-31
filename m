Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E43D07B851
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2019 05:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbfGaDoT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Jul 2019 23:44:19 -0400
Received: from sonic307-10.consmr.mail.ne1.yahoo.com ([66.163.190.33]:36927
        "EHLO sonic307-10.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727571AbfGaDoT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Jul 2019 23:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1564544657; bh=tPdyM4f7Tq8kspt5syr9wxbiHLUxanV8lkCr2Pkkkas=; h=Date:From:Reply-To:Subject:From:Subject; b=Cib/9iBhzcLfpz3yfiHTdg+WG7fDKxqRIoIaqgr/UydwLFRFzWyRKFMayjgIb/nvVI/6o78UZ1bKUIXWTaXOlx8eY4QigUlsB2qgzr5QBsziY/nFe93OP2zS7McCn9uiL775TJ4YYVH5dYqINZnUy7yc0H7KWQ2gxSSuE6FqFnMDt2prORr7kqDqieRH47EexN3UK6tZ2INmReqL3Jyjz7hsyZtRnaRsp4ycnPODqRtatfaeEKR6e7Rb1UA0NuJ4nzeKg1iblQiUuTvcRsWjo9a/U2WXBgFoXoju0AtBMViw07gRFPAcHQY06/rp4l7hcMEF2LpSVhYgT/ieFQoS3Q==
X-YMail-OSG: 1B.s7y0VM1mZghm6pqPnxPFRBR_MVnzvDs_AgKbodExOK3C3H8n_Qe7blZdAWBK
 Ad0QvrPcTX.dQ5VTHbj8MwrU20NyEK8unAnT37iZKs5ysoZ_1_DA4IgaR1aoKzMXskuAoX0YT0Nu
 eGv.hw3mgcD3tlzxMqaLqsN22_eY6QgPR68aVV0hFIjO5bUdhOmI8X7Wl22pTbbD2h2XIQWQbdLS
 vhhdnMQ8ya.pdqtoDLPOX.3KurVWGz3QNC8TJebZNKgvGx7sKe9uX71NYhTChYpONZcjdlRNF5mf
 H.iNL__NwN48VsvBlnha.xWe89WlWLW3pAcLN0RTaKsFhuv3Vk4F5RTc55K0JoFlEBNxWAucbbRu
 o9z67EvnHv5VKL93zTVfcPu1Ykmw7uxbo5o7RFS3nHohqIA1xbeTLRJq0qDc4KseKgCp9Aj8izQU
 W1SwLSVPoDDCpNfJ5IQlX0orc4XMUcE8PIA3IKd.18YbdcSJ8S8T1UKP1NmBnExea_EfIIgQEcUy
 umyYYPj1laU6NifHZ4FBumL1flpZA3CwgeR_qXMvRkc_PJjTi.gfngCMP0PL0IkbUWblpdzuPrjt
 GZ386phC5lGzC.rLN8ByJ1RjyT8G_4cjri803srFM2MWMYY8FiahPvPFiu2p6vcuDy3rFX5a7wi7
 WI0IZCkGdw35O7aBfxFxPsR2AveiwqvcsSer6xdvzpF4snlF12VlURm1Iy40hksTeREbj0N56J7p
 PWPuIy_dk4f_OPuV1Eygj09_WhlWmcsdKg7VvOFI44IiXKg7N.YBH4pcXes7AfcCevLScILBTPqJ
 3QglVNI1C073trFSXBb5M4GydbxXi07l.4SYfaw3GKeozzaU5qqrmyRB2GqKYgY6Dv3ufnz8EEeC
 IAWN.Yvh1AhluyktQBmpMn4f97vR1mdCxffEyLYc1gYWluOcprthaN9HvQmWJwQtDrCxZyLb.4nX
 Y0LA4m_5CgYrxEiu38Y.CWboajyGszAJcOz13arBI8rSyoQyLoicgvh4WzLkJu3wvQvVYH61r9Sr
 2UGRxLYTx.HeLxF65eTB86FeLm4Nxz_5zR9fZ1pjIY4DoJKfJER03sz_NW6W34s7YsxHqC67xCaD
 A.Vrij950S2BoL.uge5eq5gZvDSnKhKZeX3SsNFJKvIY3tTwNFEgb4TBrbF14LGvitu0bubgtk2r
 HX.KG0KJvj57WktKCgb_OFStwEX2whlR5f6CCDcOvxXBWi.sSkctapPMCPUieyerG
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 31 Jul 2019 03:44:17 +0000
Date:   Wed, 31 Jul 2019 03:44:12 +0000 (UTC)
From:   Aisha Gaddafi <gaddafi661@gmail.com>
Reply-To: gaisha983@gmail.com
Message-ID: <1424324438.99963.1564544652768@mail.yahoo.com>
Subject: Dear Friend,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Dear Friend,

I came across your e-mail contact prior a private search while in need of 
your assistance. My name is Aisha  Gaddafi a single Mother and a Widow with 
three Children. I am the only biological Daughter of late Libyan President 
(Late Colonel Muammar Gaddafi).

I have investment funds worth Twenty Seven Million Five Hundred Thousand 
United State Dollar ($27.500.000.00 ) and i need a trusted investment 
Manager/Partner because of my current refugee status, however, I am 
interested in you for investment project assistance in your country, may be 
from there, we can build business relationship in the nearest future.

I am willing to negotiate investment/business profit sharing ratio with you 
base on the future investment earning profits.

If you are willing to handle this project on my behalf kindly reply urgent 
to enable me provide you more information about the investment funds.

Your Urgent Reply Will Be Appreciated.

Best Regards
Mrs Aisha Gaddafi
(gaisha983@gmail.com)
