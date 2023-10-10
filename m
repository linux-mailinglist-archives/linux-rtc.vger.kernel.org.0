Return-Path: <linux-rtc+bounces-79-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2AA7BF389
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 08:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4582818F0
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Oct 2023 06:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F19BA55;
	Tue, 10 Oct 2023 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EED9463;
	Tue, 10 Oct 2023 06:58:45 +0000 (UTC)
X-Greylist: delayed 602 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 09 Oct 2023 23:58:43 PDT
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB0499;
	Mon,  9 Oct 2023 23:58:43 -0700 (PDT)
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 9C649140199;
	Tue, 10 Oct 2023 06:48:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf06.hostedemail.com (Postfix) with ESMTPA id 379272000F;
	Tue, 10 Oct 2023 06:48:11 +0000 (UTC)
Message-ID: <f511170fe61d7e7214a3a062661cf4103980dad6.camel@perches.com>
Subject: Re: [PATCH 6/7] fs/sysfs/group: make attribute_group pointers const
From: Joe Perches <joe@perches.com>
To: Max Kellermann <max.kellermann@ionos.com>, Guenter Roeck
	 <linux@roeck-us.net>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, James
 Morse <james.morse@arm.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robert Richter <rric@kernel.org>, Jean Delvare <jdelvare@suse.com>, Jason
 Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Bart Van
 Assche <bvanassche@acm.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Dan Williams
 <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Dave
 Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Jiri Slaby
 <jirislaby@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Mike
 Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Leo Yan
 <leo.yan@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra
 <peterz@infradead.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>,  Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas
 <bhelgaas@google.com>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de
 Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,  Jiri Olsa
 <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers
 <irogers@google.com>,  Adrian Hunter <adrian.hunter@intel.com>, Sebastian
 Reichel <sre@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, nvdimm@lists.linux.dev, 
 linux-nvme@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-serial@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-scsi@vger.kernel.org
Date: Mon, 09 Oct 2023 23:48:10 -0700
In-Reply-To: <CAKPOu+8k2x1CucWSzoouts0AfMJk+srJXWWf3iWVOeY+fWkOpQ@mail.gmail.com>
References: <20231009165741.746184-1-max.kellermann@ionos.com>
	 <20231009165741.746184-6-max.kellermann@ionos.com>
	 <264fa39d-aed6-4a54-a085-107997078f8d@roeck-us.net>
	 <CAKPOu+8k2x1CucWSzoouts0AfMJk+srJXWWf3iWVOeY+fWkOpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: x66gji9pr8zwbank5ef871m9qoojjjfr
X-Rspamd-Server: rspamout04
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Rspamd-Queue-Id: 379272000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19bm9nHqj2XrX3TKwatvC/C1GajNvD5h9I=
X-HE-Tag: 1696920491-749924
X-HE-Meta: U2FsdGVkX1/+029EmPc9sKVNFK2VRUjBCte/A2E+5y43hxFCP+MAKFoIxkcikfn6Jucu52vLqnvIqQDvdm6WvqlwnI8PH42O3yPwjrf6/Rk44z8SFUR40tWN1QdYZq3HPOEvKn0PLMPTqRRMr7zlpFwkMW85ySQYIyr+J8E4OP6W/LoiP3zYhR+0cmnV5ToftIwEMltweE+g/zUx+NL1fSjTbqk3Sf4w33VMSw7k9oncskJ8CUN/bQZEOiHhpNbgGpLqoQJ7ob3InQymsj8a//o/6ldtQbuoxFCk/RnYuGfC0EahOFEMbfIs5+kJ0g+hK4chvkcdMx/L2QmQgmCvPhqiadvx8BYdkeJ2IpCV5Y5g+W85x67f7ON0uqOVXWab
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, 2023-10-09 at 22:05 +0200, Max Kellermann wrote:
> On Mon, Oct 9, 2023 at 7:24=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> > Also, I don't know why checkpatch is happy with all the
> >=20
> >         const struct attribute_group *const*groups;
> >=20
> > instead of
> >=20
> >         const struct attribute_group *const *groups;
>=20
> I found out that checkpatch has no check for this at all; it does
> complain about such lines, but only for local variables. But that
> warning is actually a bug, because this is a check for unary
> operators: it thinks the asterisk is a dereference operator, not a
> pointer declaration, and complains that the unary operator must be
> preceded by a space. Thus warnings on local variable are only correct
> by coincidence, not by design.
>=20
> Inside structs or parameters (where my coding style violations can be
> found), it's a different context and thus checkpatch doesn't apply the
> rules for unary operators.

My opinion is that const use in the kernel should almost
always have whitespace before and after it except when
preceded by a open parenthesis or a newline.

$ git grep -wh const -- '*.[ch]' | \
  grep -oP "[ \*\(]?const[ \*]?" | \
  sort | uniq -c | sort -rn
 222438  const=20
  83386 const=20
  51667 (const=20
   2766 *const=20
    834 const
    442  const
    343  const*
     88 *const
     37 (const
      4 *const*


