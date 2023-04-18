Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268E76E60A8
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Apr 2023 14:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbjDRMIf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 18 Apr 2023 08:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231536AbjDRMIN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 18 Apr 2023 08:08:13 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28DB110258
        for <linux-rtc@vger.kernel.org>; Tue, 18 Apr 2023 05:03:11 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id ok39pRTocv5uIok3BpFE2o; Tue, 18 Apr 2023 14:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681819389; bh=WxwqFFkDbe79uSJ7lJqwvVYhNm2qijaNsjGtlh3ySjQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=NwGvlBJ4LfPxNgQ+TxeJJDQw9eeb3OxtEJflIQfFqYCgTmFvnkL8WvmIuXUxP1YfA
         MBVZiAkli8yPK7v4Ga0DPXSFlDM7zOZODbPZLIWSXLx72d3X3b0ciCSzz4ab3qd7Wa
         Cwx/I7zNWTO34+S/dV54en9lh1dg1ojFhVFYp9DlPD6IVd+mWKmYWNN1LietK4eEz4
         EWTKy1nAvLiLqf4msfd+y0HHYGzM7V7v+N3IVUS8kt/ICfz0soGL8FnokbiuJB7H7H
         Ipt6lajRIIo7zpQFR+bxnaqxa4Cr9Sp5CFoeF8GgiGAiyxHsDomN3Fg9g2yHMAiZnr
         R35raQ7fTOR2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1681819389; bh=WxwqFFkDbe79uSJ7lJqwvVYhNm2qijaNsjGtlh3ySjQ=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=NwGvlBJ4LfPxNgQ+TxeJJDQw9eeb3OxtEJflIQfFqYCgTmFvnkL8WvmIuXUxP1YfA
         MBVZiAkli8yPK7v4Ga0DPXSFlDM7zOZODbPZLIWSXLx72d3X3b0ciCSzz4ab3qd7Wa
         Cwx/I7zNWTO34+S/dV54en9lh1dg1ojFhVFYp9DlPD6IVd+mWKmYWNN1LietK4eEz4
         EWTKy1nAvLiLqf4msfd+y0HHYGzM7V7v+N3IVUS8kt/ICfz0soGL8FnokbiuJB7H7H
         Ipt6lajRIIo7zpQFR+bxnaqxa4Cr9Sp5CFoeF8GgiGAiyxHsDomN3Fg9g2yHMAiZnr
         R35raQ7fTOR2g==
Date:   Tue, 18 Apr 2023 14:03:07 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-rtc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-twl: add NVRAM support
Message-ID: <ZD6G+6WtjpDYs3Zw@lenoch>
References: <ZDf7qZTiml0ijD2g@lenoch>
 <20230418094303.GB14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418094303.GB14287@atomide.com>
X-CMAE-Envelope: MS4wfB9kDTuGZw1boCIyWOxo1sH3lUn8v2j9pdaLfHsOG8rE6PCtr1jPSKViF3pT7NbkYZrU6BHg2st+PsTWCSf8MlnTBiQd29JU3/5/VM8W5YvW+xiuamjV
 Zr2tp+mmZoKKlT1QcKe4to9gvOnH22fhkUZGvngoAri0PJUgiPfFD/zPyXNBRMr1ERjlcnwN8+4I6VVH7VCqeDK6G1JqNKaehzE0CQZdLhLB18tYQnTCAtPA
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Tony,

On Tue, Apr 18, 2023 at 12:43:03PM +0300, Tony Lindgren wrote:
> Hi,
> 
> * Ladislav Michl <oss-lists@triops.cz> [230413 12:56]:
> > Export SRAM using nvmem.
> 
> Patch looks good to me, just wondering how this is used..

This has been sitting in my tree for over five years and it is used
to store boot state. Patches for u-boot are pending here as well,
but I'll do my best to upstream reasonable parts of them.

All was done for failsafe device updating using A/B scheme. Device
is also using U-Boot's Falcon mode to speed things up, so SPL
loads kernel directly from UBI volume. To decide which one to load
and boot, information from NVRAM is used - there is no other memory
except NVRAM and NAND. I didn't want to use NAND for this purpose,
see bellow how NVRAM failures are handled.

> Are we just exporting the nvram via sysfs for userspace to use it
> for whatever, or is there also some RTC core layer use for it?

RTC itself is not using it. My board is using RAUC for updates:
https://rauc.readthedocs.io/en/latest/examples.html#symmetric-a-b-setup

Information in NVRAM is crc protected and once inconsistent, normal
U-Boot is loaded instead and information from it's env is used.
In worst case it attempts recovery.

Although U-Boot is used, this scenarion is not handled by RAUC out
of the box, so custom integration is used:
https://rauc.readthedocs.io/en/latest/integration.html#custom

And here's the code for it:

#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/stat.h>
#include <sys/sysmacros.h>
#include <sys/types.h>

#include <libubi.h>

#ifdef DEBUG
#define debug(x...)	fprintf(stderr, x)
#else
#define debug(x...)	do {} while (0)
#endif

struct bootstate {
	uint8_t selected;	/* 0xa0 | selected */
	uint8_t a_left;
	uint8_t b_left;
	uint8_t crc;
};

/* Keep in sync with U-Boot configuration! */
#define KERNEL_VOLID	3
#define DTB_VOLID	5

#define POLY		(0x1070U << 3)

static uint8_t crc8(uint8_t crc, uint8_t byte)
{
	unsigned data = (crc ^ byte) << 8;
	int i = 8;

	while (i--) {
		if (data & 0x8000)
			data ^= POLY;
		data <<= 1;
	}

	return data >> 8;
}

static int bootstate_open(int rw)
{
	return open("/sys/bus/nvmem/devices/twl-backup-0/nvmem", (rw ? O_RDWR : O_RDONLY) | O_SYNC);
}

static int bootstate_read(int fd, struct bootstate *bs)
{
	uint8_t crc;

	switch (pread(fd, bs, sizeof(*bs), 0)) {
	case -1:
		return errno;
	case sizeof(*bs):
		break;
	default:
		return -1;
	}
	debug("bootstate <- %02x %02x %02x %02x\n", bs->selected, bs->a_left, bs->b_left, bs->crc);
	if ((bs->selected & 0xf0) != 0xa0)
		return -2;
	crc = crc8(0, bs->selected);
	crc = crc8(crc, bs->a_left);
	crc = crc8(crc, bs->b_left);
	if (crc != bs->crc)
		return -3;
	bs->selected &= 0xf;
	if ((bs->selected != 0) && (bs->selected != 1))
		return -4;
	return 0;
}

static int bootstate_write(int fd, struct bootstate *bs)
{
	bs->selected |= 0xa0;
	bs->crc = crc8(0, bs->selected);
	bs->crc = crc8(bs->crc, bs->a_left);
	bs->crc = crc8(bs->crc, bs->b_left);
	debug("bootstate -> %02x %02x %02x %02x\n", bs->selected, bs->a_left, bs->b_left, bs->crc);
	switch (pwrite(fd, bs, sizeof(*bs), 0)) {
	case -1:
		return errno;
	case sizeof(*bs):
		break;
	default:
		return -1;
	}
	return 0;
}

/* create temporary node to open ubi device */
static char* node_of_major_minor(unsigned int maj, unsigned int min)
{
	static char n[128];

	sprintf(n, "/dev/.ubi_id-%u-%u-%u", (unsigned int)getpid(), maj, min);
	unlink(n);
	if (mknod(n, (S_IFCHR | 0600), makedev(maj, min)) == 0)
		return n;

	debug("failed to create temporary UBI node: %d (%s)\n", errno, strerror(errno));

	return NULL;
}

static int update_ubi_names(struct bootstate *bs)
{
	static const char *kernel_names[] = { "kernel", "kernel_r" };
	static const char *dtb_names[] = { "dtb", "dtb_r" };

	int i, j, err, invalid;
	struct ubi_rnvol_req rnvol;
	struct ubi_info ubi_info;
	struct ubi_dev_info dev_info;
	struct ubi_vol_info vol_info;
	libubi_t libubi;
	char *node;

	libubi = libubi_open();
	if (!libubi)
		return -1;
	err = ubi_get_info(libubi, &ubi_info);
	if (err)
		goto out_close;
	if (ubi_info.dev_count == 0) {
		err = -1;
		goto out_close;
	}
	for (i = ubi_info.lowest_dev_num;
	     i <= ubi_info.highest_dev_num; i++) {
		if (!ubi_dev_present(libubi, i))
			continue;
		err = ubi_get_dev_info1(libubi, i, &dev_info);
		if (err)
			goto out_close;
		if (dev_info.vol_count == 0) {
			err = -1;
			goto out_close;
		}
		/* We do expect one UBI device with properly named volumes */
		for (j = dev_info.lowest_vol_id;
		     j <= dev_info.highest_vol_id; j++) {
			err = ubi_get_vol_info1(libubi, dev_info.dev_num, j, &vol_info);
			if (err == -1) {
				if (errno == ENOENT)
					continue;

				goto out_close;
			}
			switch (vol_info.vol_id) {
			case KERNEL_VOLID:
				invalid = strcmp(vol_info.name, kernel_names[bs->selected]);
				break;
			case KERNEL_VOLID + 1:
				invalid = strcmp(vol_info.name, kernel_names[bs->selected ^ 1]);
				break;
			case DTB_VOLID:
				invalid = strcmp(vol_info.name, dtb_names[bs->selected]);
				break;
			case DTB_VOLID + 1:
				invalid = strcmp(vol_info.name, dtb_names[bs->selected ^ 1]);
				break;
			}
			/* Rename all relevant volumes once any with unxpected name found */
			if (invalid) {
				node = node_of_major_minor(dev_info.major, dev_info.minor);
				if (!node) {
					err = -1;
					goto out_close;
				}
				rnvol.ents[0].vol_id = KERNEL_VOLID + bs->selected;
				rnvol.ents[0].name_len = strlen(kernel_names[0]);
				strcpy(rnvol.ents[0].name, kernel_names[0]);
				rnvol.ents[1].vol_id = KERNEL_VOLID + (bs->selected ^ 1);
				rnvol.ents[1].name_len = strlen(kernel_names[1]);
				strcpy(rnvol.ents[1].name, kernel_names[1]);
				rnvol.ents[2].vol_id = DTB_VOLID + bs->selected;
				rnvol.ents[2].name_len = strlen(dtb_names[0]);
				strcpy(rnvol.ents[2].name, dtb_names[0]);
				rnvol.ents[3].vol_id = DTB_VOLID + (bs->selected ^ 1);
				rnvol.ents[3].name_len = strlen(dtb_names[1]);
				strcpy(rnvol.ents[3].name, dtb_names[1]);
				rnvol.count = 4;
				debug("Renaming UBI volumes:\n%s: %d\n%s: %d\n%s: %d\n%s: %d\n",
					rnvol.ents[0].name, rnvol.ents[0].vol_id,
					rnvol.ents[1].name, rnvol.ents[1].vol_id,
					rnvol.ents[2].name, rnvol.ents[2].vol_id,
					rnvol.ents[3].name, rnvol.ents[3].vol_id);
				err = ubi_rnvols(libubi, node, &rnvol);
				unlink(node);
				goto out_close;
			}
		}
		debug("UBI volume names correct.\n");
		err = 0;
		break;
	}
out_close:
	libubi_close(libubi);
	return err;
}

static int get_slot(const char *slot)
{
	if (strcmp(slot, "system0") == 0)
		return 0;
	if (strcmp(slot, "system1") == 0)
		return 1;
	return -1;
}

static int get_count(const char *state)
{
	if (strcmp(state, "good") == 0)
		return 3;
	if (strcmp(state, "bad") == 0)
		return 0;
	return -1;
}

static int out_str(const char* str)
{
	debug(">>> %s\n", str);
	return puts(str) == EOF ? EXIT_FAILURE : EXIT_SUCCESS;
}

static int out_state(int good)
{
	return out_str(good ? "good" : "bad");
}

int main(int argc, char *argv[])
{
	int count, fd, slot;
	struct bootstate bs;

	debug("%s %s %s\n",
		(argc > 1) ? argv[1] : "",
		(argc > 2) ? argv[2] : "",
		(argc > 3) ? argv[3] : "");

	if (argc > 2 && strcmp(argv[1], "get-state") == 0) {
		slot = get_slot(argv[2]);
		if (slot >= 0) {
			fd = bootstate_open(0);
			if (fd != -1 && bootstate_read(fd, &bs) == 0)
				return out_state(0 < (slot == 0 ? bs.a_left : bs.b_left));
		}
	} else if (argc > 3 && strcmp(argv[1], "set-state") == 0) {
		if ((count = get_count(argv[3])) >= 0) {
			fd = bootstate_open(1);
			if (fd != -1) {
				slot = get_slot(argv[2]);
				if (bootstate_read(fd, &bs)) {
					memset(&bs, 0, sizeof(bs));
					if (count)
						bs.selected = slot;
					else
						bs.selected = !!slot;
				}
				switch (slot) {
				case 0:
					bs.a_left = count;
					break;
				case 1:
					bs.b_left = count;
					break;
				default:
					return EXIT_FAILURE;
				}
				update_ubi_names(&bs);
				if (bootstate_write(fd, &bs) == 0)
					return EXIT_SUCCESS;
			}
		}
	} else if (argc > 1 && strcmp(argv[1], "get-primary") == 0) {
		fd = bootstate_open(0);
		if (fd != -1 && bootstate_read(fd, &bs) == 0) {
			switch (bs.selected) {
			case 0:
				return out_str("system0");
			case 1:
				return out_str("system1");
			default:
				break;
			}
		}
	} else if (argc > 2 && strcmp(argv[1], "set-primary") == 0) {
		fd = bootstate_open(1);
		if (fd != -1 && bootstate_read(fd, &bs) == 0) {
			switch (get_slot(argv[2])) {
			case 0:
				bs.selected = 0;
				bs.a_left = 3;
				break;
			case 1:
				bs.selected = 1;
				bs.b_left = 3;
				break;
			default:
				return EXIT_FAILURE;
			}
			if (bootstate_write(fd, &bs) == 0)
				return EXIT_SUCCESS;
		}
	} else {
		debug("malformed command.\n");
	}

	return EXIT_FAILURE;
}


Hopefully above clarifies use case a bit,
	ladis
