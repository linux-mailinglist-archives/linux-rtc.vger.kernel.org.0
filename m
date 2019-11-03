Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F76ED39D
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Nov 2019 15:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbfKCOsD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 3 Nov 2019 09:48:03 -0500
Received: from sonic305-2.consmr.mail.bf2.yahoo.com ([74.6.133.41]:41032 "EHLO
        sonic305-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727425AbfKCOsD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 3 Nov 2019 09:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1572792482; bh=E+ks7AydzaUb4ISZTuxin7s0E6gVmk5020fTLYVYB5E=; h=Date:From:Reply-To:Subject:From:Subject; b=ps9q7rhB62NXJ8hsxXX2Ya+PvUpIy9P14NOjYmu9xhIRMbmgP4OtTAG3iMsr/aNT61drWhwkvTyvIU4CHc603mWLZG0tfrELYF1iPlLfFuMOItzfKwZS8Rh0b3DtIQHmzA+qnovD0Y7x4pdB2ANHqseFg1X2H+ZR7lGqWy7iCDbwiG2NoK8JIxAQLBd8kdjEusj2rQXQn5caYmZiNTXaPzIote7tRAwKKLMy86QAbJQD6yx0iwQ+jogn8OlcAwnThNN5UBl+QxoL0cuqkDt46L0vj/2PF2FF9IKxPkmvTGuXYboRgwc9BKglmmOvRc7yNXvsDdVp4NvsbA6Qf+hBqA==
X-YMail-OSG: lxBrJWIVM1mnOL8P97YIdYhopZiLo.oMWvp5WZb_Ukj1tp0nCRNz.r0OCFvVuA.
 7gJPlAF4uOzjwx3aQochxSYHvW_B4SRizxxYLBaHznBrqaFwflUwqkBk01QljAA96vm5P7TO6Gf1
 nEGcaOfg_qOz.KQ7QTxwSVLYfnu4Dws1nfZQVF_DoxbbGoIUkzNb9wz4HpIVDfUAdE3gaNcAVpy_
 JzU2kvZidX64PGx3p64HeR8PbedZ4ZIUwcqDXZrQQwWw6WDG7DbZ.RZo1Tqoe8fqj.dqe3YJBdDr
 of_K_FG1VM99MsanTuCjUV2j0BBhCNNjUYmdiuZu_qfJydp2A4X7u9TpQo1RNp6q9kjNhUs.1rWc
 V9LsPF_3XljRvr7ja114MW08CUdEVcst..nTBu4aCqUcFXydYgVrojQJNwkZN8gIbOoFO_2ZAwsL
 nPt0.wpqvKPZlYtBhNkTjPeRVnDzPe.BeDtHEHLB9QA9CYWy9oPcQW4wiWTnnQ6wlniAP_vNMU7S
 R.YRIwsV87EKuR5abUesULSZ9q3HA..eyWyWmF3d5Fj9YlA9WHLV9yRRt2CaePfEOXnNVxGRxjm5
 nUITKi_Rl2nf9B_GMnaR9bx1dko0JYyDM1oTK7Rw9HqYpHrZutYunZtK1ujhJ.lnkBN3Ud04lj9c
 sz5262eOnq40pmHgjA5jBpesPsUZmqq4C1MeO.bf2n1ZCs4UvroAF9noaI7OO9YatKOLwJA2kfTf
 2hPfH3I4DwZHc_hMZuREJnSL7sqAyfn8r0YrYfA.ZKaiYgrYl4CHhnIgUrQfpsbJNM5nfaEGB4Yy
 HtY.0uYZ8I4XyfgYzymsGztcCy93ynrWWE8zHQdtcXBnRPEtzb.lNlBF5Ofb8szTUJeAEKJpq.KS
 fTZ73MBiYWg6Mx._BWxTf9GeBXSJLa2MAZnmlcCGHI_Fn_IPovnJJVcWOGu4esC70hJ8NJIVdyMw
 bgea8nkj0WqWrE.1hzH1Lgm3SibixFQw8lAYs2lrwo623ZO1K0VwrFOTG6Cttxz_kq_B0hplNPIJ
 fhLMeGNWFa8Ca.AG0z6CJO._dNwRnXfJVvbqawwekr7mp.nAN2L8oBGDJbUiMYubeZHjBjeyFr11
 9U9sMjln4U5rhH3g83o0BBrNEDoGN8GneMhBo7WEkcG6WGQkh4z7sk0R2JMKoqYg79_IWwoj7MET
 H09nFG.1uFIUoaR8pgpDW.MO4tng9n9ZZWwDhDxvSMVA1yZWBrdiZ75QWBQIgvmUnKTiPzfPvsaf
 9aEJ4Hz5ZcpZ38GGntOCQxNcApQlaDe7VJoZ_6jJ4H4r.RmeQZVFO8p0JNBjWLIv56tU5sg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.bf2.yahoo.com with HTTP; Sun, 3 Nov 2019 14:48:02 +0000
Date:   Sun, 3 Nov 2019 14:48:01 +0000 (UTC)
From:   Aisha Gaddafi <gaddafi50@aol.com>
Reply-To: gaddafia504@gmail.com
Message-ID: <1693605648.300692.1572792481051@mail.yahoo.com>
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
(gaddafia504@gmail.com)
