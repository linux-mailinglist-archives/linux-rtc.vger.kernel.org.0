Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA178E705E
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Oct 2019 12:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388449AbfJ1L3e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 28 Oct 2019 07:29:34 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:39425 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731363AbfJ1L3d (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 28 Oct 2019 07:29:33 -0400
X-Originating-IP: 91.217.168.176
Received: from localhost (unknown [91.217.168.176])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3E39E1C000C;
        Mon, 28 Oct 2019 11:29:27 +0000 (UTC)
Date:   Mon, 28 Oct 2019 12:29:27 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     Rob Herring <robh@kernel.org>,
        linux-realtek-soc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Rutland <mark.rutland@arm.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: rtc: realtek: Convert RTD119x to
 schema
Message-ID: <20191028112927.GL3125@piout.net>
References: <20191020040817.16882-1-afaerber@suse.de>
 <20191020040817.16882-3-afaerber@suse.de>
 <20191025212015.GA29978@bogus>
 <5491f3ed-93bf-1c4d-60f8-5d646c3bd2fb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5491f3ed-93bf-1c4d-60f8-5d646c3bd2fb@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/10/2019 11:46:48+0100, Andreas Färber wrote:
> Am 25.10.19 um 23:20 schrieb Rob Herring:
> > On Sun, Oct 20, 2019 at 06:08:11AM +0200, Andreas Färber wrote:
> >> Convert the RTD119x binding to a YAML schema.
> >>
> >> Signed-off-by: Andreas Färber <afaerber@suse.de>
> >> ---
> >>  v2: New
> >>  
> >>  .../devicetree/bindings/rtc/realtek,rtd119x.txt    | 16 ---------
> >>  .../devicetree/bindings/rtc/realtek,rtd119x.yaml   | 38 ++++++++++++++++++++++
> >>  2 files changed, 38 insertions(+), 16 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.txt
> >>  create mode 100644 Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
> > 
> > 
> >> diff --git a/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
> >> new file mode 100644
> >> index 000000000000..71b7396bd469
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/rtc/realtek,rtd119x.yaml
> 
> While renaming the file to .yaml I would like to also rename it to 1195.
> It would need to be 1x9x to cover RTD1195 and e.g. RTD1296, and looking
> forward the wildcard may need to be 1xxx to cover also RTD1619, which
> quickly becomes unrecognizable.
> 

I'm fine with removing wildcards as much as possible.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
